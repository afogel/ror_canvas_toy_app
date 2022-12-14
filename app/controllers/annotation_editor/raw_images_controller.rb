class AnnotationEditor::RawImagesController < ApplicationController
  before_action :set_raw_image, only: %i[show update]
  before_action :set_label, only: %i[show update]

  # GET annotation_editor/labels/1/raw_images/1
  def show
    @images = RawImage.all.order(:id)
    @labels = Label.all.order(:id)
    @previous_image = previous_record(@images, @raw_image)
    @next_image = next_record(@images, @raw_image)
    @previous_label = previous_record(@labels, @label)
    @next_label = next_record(@labels, @label)
    @annotation = Annotation.find_by(
      raw_image: @raw_image,
      label: @label
    ) || Annotation.new
  end

  # PATCH/PUT annotation_editor/labels/1/raw_images/1
  def update
    @annotation = Annotation.find_by(
      raw_image: @raw_image,
      label: @label
    ) || Annotation.new(raw_image: @raw_image, label: @label)
    @annotation.landmarks = raw_image_params[:landmarks]
    if @annotation.save
      flash[:notice] = "Annotation saved!"
    else
      flash[:alert] = "There was an error saving your annotation"
    end
    redirect_to annotation_editor_label_raw_image_path(@label, @raw_image)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_raw_image
    @raw_image = RawImage.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_label
    @label = Label.find(params[:label_id])
  end

  # Only allow a list of trusted parameters through.
  def raw_image_params
    params.require(:raw_image).permit(:landmarks)
  end

  def next_record(collection, record)
    record_idx = collection.find_index(record)
    record_idx + 1 >= collection.length ? collection[0] : collection[record_idx + 1]
  end

  def previous_record(collection, record)
    record_idx = collection.find_index(record)
    record_idx - 1 < 0 ? collection[-1] : collection[record_idx - 1]
  end
end

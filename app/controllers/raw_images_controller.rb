class RawImagesController < ApplicationController
  before_action :set_raw_image, only: %i[ show edit update destroy ]

  # GET /raw_images or /raw_images.json
  def index
    @raw_images = RawImage.all
  end

  # GET /raw_images/1 or /raw_images/1.json
  def show
  end

  # GET /raw_images/new
  def new
    @raw_image = RawImage.new
  end

  # GET /raw_images/1/edit
  def edit
  end

  # POST /raw_images or /raw_images.json
  def create
    @raw_image = RawImage.new(raw_image_params)

    respond_to do |format|
      if @raw_image.save
        format.html { redirect_to raw_image_url(@raw_image), notice: "Raw image was successfully created." }
        format.json { render :show, status: :created, location: @raw_image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @raw_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_images/1 or /raw_images/1.json
  def update
    respond_to do |format|
      if @raw_image.update(raw_image_params)
        format.html { redirect_to raw_image_url(@raw_image), notice: "Raw image was successfully updated." }
        format.json { render :show, status: :ok, location: @raw_image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @raw_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_images/1 or /raw_images/1.json
  def destroy
    @raw_image.destroy

    respond_to do |format|
      format.html { redirect_to raw_images_url, notice: "Raw image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_image
      @raw_image = RawImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def raw_image_params
      params.require(:raw_image).permit(:image)
    end
end

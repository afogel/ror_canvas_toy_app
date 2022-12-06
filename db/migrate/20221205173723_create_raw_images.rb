class CreateRawImages < ActiveRecord::Migration[7.0]
  def change
    create_table :raw_images do |t|
      t.timestamps
    end
  end
end

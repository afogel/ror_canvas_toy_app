class CreateAnnotations < ActiveRecord::Migration[7.0]
  def change
    create_table :annotations do |t|
      t.references :label, null: false, foreign_key: true
      t.references :raw_image, null: false, foreign_key: true
      t.jsonb :landmarks

      t.timestamps
    end
  end
end

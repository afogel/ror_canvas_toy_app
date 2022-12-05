json.extract! raw_image, :id, :image, :created_at, :updated_at
json.url raw_image_url(raw_image, format: :json)
json.image url_for(raw_image.image)

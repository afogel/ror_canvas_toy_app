# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

["Lion", "Hippopotamus", "Kudu"].each do |name|
  Label.create(name: name, kind: "Animal")
end

["lion_1.jpg", "kudus.jpg", "hippo_1.jpg", "hippo_2.jpg"].each do |filename|
  img = RawImage.new
  img.image.attach(io: File.open("public/#{filename}"), filename: filename)
  img.save!
end

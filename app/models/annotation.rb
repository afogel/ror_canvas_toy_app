class Annotation < ApplicationRecord
  belongs_to :label
  belongs_to :raw_image
end

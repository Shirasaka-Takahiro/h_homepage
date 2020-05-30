class GalleryCategoryRelationship < ApplicationRecord
  belongs_to :gallery
  belongs_to :category
end

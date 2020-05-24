class Gallery < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :gallery_category_relationships
  has_many :categories, through: :gallery_category_relationships
end

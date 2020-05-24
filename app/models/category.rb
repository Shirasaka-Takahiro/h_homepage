class Category < ApplicationRecord
  has_many :gallery_category_relationships
  has_many :galleries, through: :gallery_category_relationships
end

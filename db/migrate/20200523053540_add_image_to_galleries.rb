class AddImageToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :image, :string
  end
end

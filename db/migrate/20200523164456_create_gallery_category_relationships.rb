class CreateGalleryCategoryRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_category_relationships do |t|
      t.references :gallery, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

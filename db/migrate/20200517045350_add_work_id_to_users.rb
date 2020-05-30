class AddWorkIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :work_id, :integer
  end
end

class AddInstagramIdToShops < ActiveRecord::Migration
  def change
    add_column :shops, :instagram_id, :integer, limit: 8
  end
end

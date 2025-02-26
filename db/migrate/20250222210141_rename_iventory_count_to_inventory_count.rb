class RenameIventoryCountToInventoryCount < ActiveRecord::Migration[8.0]
  def change
    rename_column :products, :iventory_count, :inventory_count
  end
end

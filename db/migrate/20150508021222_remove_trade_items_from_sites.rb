class RemoveTradeItemsFromSites < ActiveRecord::Migration
  def change
    remove_column :sites, :trade_items
  end
end

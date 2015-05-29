class EditTradeItemsInSites < ActiveRecord::Migration
  def change
    remove_column :sites, :trade_items
    add_column :sites, :trade_items, :string, array: true, default: []
  end
end

class AddFieldsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :name, :string
    add_column :sites, :trade_items, :text
  end
end

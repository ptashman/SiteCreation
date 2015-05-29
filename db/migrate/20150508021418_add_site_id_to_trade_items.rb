class AddSiteIdToTradeItems < ActiveRecord::Migration
  def change
    add_column :trade_items, :site_id, :integer
  end
end

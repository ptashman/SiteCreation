class AddSiteIdToTables < ActiveRecord::Migration
  def change
    add_column :users, :site_id, :integer
    add_column :microposts, :site_id, :integer
    add_column :relationships, :site_id, :integer
  end
end

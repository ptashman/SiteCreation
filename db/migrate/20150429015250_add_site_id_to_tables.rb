class AddSiteIdToTables < ActiveRecord::Migration
  def change
    add_column :users, :site_id, :integer
    add_column :posts, :site_id, :integer
  end
end

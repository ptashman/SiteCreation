class AddOwnerIdToSites < ActiveRecord::Migration
  def change
    add_column :sites, :owner_id, :integer
  end
end

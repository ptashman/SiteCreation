class ChangeContentToWantsAndHasInMicropost < ActiveRecord::Migration
  def change
    remove_column :microposts, :content
    add_column :microposts, :wants_item, :string
    add_column :microposts, :has_item, :string
  end
end

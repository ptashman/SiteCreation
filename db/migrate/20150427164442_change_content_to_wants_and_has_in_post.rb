class ChangeContentToWantsAndHasInPost < ActiveRecord::Migration
  def change
    remove_column :posts, :content
    add_column :posts, :wants_item, :string
    add_column :posts, :has_item, :string
  end
end

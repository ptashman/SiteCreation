class AddWantsDescriptionAndHasDescriptionToPost < ActiveRecord::Migration
  def change
    add_column :posts, :wants_description, :text
    add_column :posts, :has_description, :text
  end
end

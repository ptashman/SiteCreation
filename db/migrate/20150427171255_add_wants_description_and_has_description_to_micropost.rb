class AddWantsDescriptionAndHasDescriptionToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :wants_description, :text
    add_column :microposts, :has_description, :text
  end
end

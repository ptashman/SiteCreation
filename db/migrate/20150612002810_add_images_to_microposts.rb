class AddImagesToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :wants_image, :string
    add_column :microposts, :has_image, :string
  end
end

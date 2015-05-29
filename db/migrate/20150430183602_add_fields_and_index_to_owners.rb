class AddFieldsAndIndexToOwners < ActiveRecord::Migration
  def change
    add_index :owners, :email, unique: true
    add_column :owners, :password_digest, :string
    add_column :owners, :remember_token, :string
    add_index  :owners, :remember_token
  end
end

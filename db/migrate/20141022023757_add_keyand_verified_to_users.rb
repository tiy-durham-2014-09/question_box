class AddKeyandVerifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :key, :string
    add_column :users, :verified, :boolean, default: false
  end
end

class AddClickToUser < ActiveRecord::Migration
  def change
    add_column :users, :click, :boolean, :default => false
    add_column :users, :token, :string
  end
end

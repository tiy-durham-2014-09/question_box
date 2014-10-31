class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :github_url, :string
    add_column :users, :so_url, :string
    add_column :users, :twitter_url, :string
  end
end

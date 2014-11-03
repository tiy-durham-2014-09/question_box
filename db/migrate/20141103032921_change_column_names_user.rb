class ChangeColumnNamesUser < ActiveRecord::Migration
  change_table :users do |t|
	  t.rename :github_url, :github_username
	  t.rename :so_url, :stack_overflow_url
	  t.rename :twitter_url, :twitter_username
  end
end


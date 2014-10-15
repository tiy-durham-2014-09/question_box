class ChangeValueToUpInVotes < ActiveRecord::Migration
  def change
		rename_column :votes, :value, :up
	  change_column :votes, :up, :boolean
  end
end

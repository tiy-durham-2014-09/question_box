class ChangeVoteValueToBoolean < ActiveRecord::Migration
  def change
    change_column :votes, :value, :boolean
  end
end

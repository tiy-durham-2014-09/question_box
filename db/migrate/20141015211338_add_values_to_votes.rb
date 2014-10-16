class AddValuesToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :value, :boolean
  end
end

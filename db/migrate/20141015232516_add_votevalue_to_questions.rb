class AddVotevalueToQuestions < ActiveRecord::Migration
  def change
	  add_column :questions, :votevalue, :integer
  end
end

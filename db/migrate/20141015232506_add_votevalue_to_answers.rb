class AddVotevalueToAnswers < ActiveRecord::Migration
  def change
		add_column :answers, :votevalue, :integer
  end
end

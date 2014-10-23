class AddCommentVoteToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :comment, index: true
    add_reference :answers, :vote, index: true
  end
end

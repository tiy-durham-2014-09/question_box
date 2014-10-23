class AddCommentVoteAndTagToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :comment, index: true
    add_reference :questions, :vote, index: true
    add_reference :questions, :tag, index: true
  end
end

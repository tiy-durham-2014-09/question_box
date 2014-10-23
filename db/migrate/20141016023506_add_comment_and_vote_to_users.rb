class AddCommentAndVoteToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :comment, index: true
    add_reference :users, :vote, index: true
  end
end

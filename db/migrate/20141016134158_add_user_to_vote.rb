class AddUserToVote < ActiveRecord::Migration
  def change
    add_reference :vote, :user, index: true
  end
end

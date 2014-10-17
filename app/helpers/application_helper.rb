module ApplicationHelper

  def vote_for(value, user)
      self.votes.create!(:value => value, :user => user)
  end

end

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end

  test "should have a user" do
    check_presence(@vote, :user)
  end

  test "should have a voteable_id" do
    check_presence(@vote, :voteable_id)
  end

end

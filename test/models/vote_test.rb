require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end

  test "should belong to user" do
    check_presence(@vote, :user)
  end

  

end

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote = Vote.new
  end
  test "is associated to a user" do
    check_presence(@vote, :user_id)
  end
  test "has a value" do
    check_presence(@vote, :value)
  end
end

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "test vote has user" do
    v = votes(:one)
    assert v.user_id, "all votes must have a user"
  end

  test "vote can be changed" do
    v = votes(:one)
    orig = v.is_positive
    v.flip!
    assert v.positive? != orig, "all votes must be changable to the opposite"
  end

  test "when a positive vote is given to something a user created (question or answer), +10 points to that user"

  end
end

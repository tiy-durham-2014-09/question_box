require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "test comment has text" do
    c = comments(:one)
    assert c.text, "comment must contain text"
  end

  test "test comment belongs to user" do
    c = comments(:one)
    assert c.user_id, "comment must belong to a user"
  end
end

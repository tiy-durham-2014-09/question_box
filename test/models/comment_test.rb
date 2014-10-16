require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = Comment.new
  end

  test "should have content" do
    check_presence(@comment, :content)
  end

  test "should belong to a user" do
    check_presence(@comment, :user)
  end

  # polymorphic association
  test "should belong to a commentable" do
    check_presence(@comment, :commentable_id)
    check_presence(@comment, :commentable_type)
  end
end

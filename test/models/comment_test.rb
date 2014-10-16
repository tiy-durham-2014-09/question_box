require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = Comment.new
  end

  test "should have text" do
    check_presence(@comment, :text)
  end

  test "should belong to a user" do
    check_presence(@comment, :user)
  end

  test "should have a commentable_id" do
    check_presence(@comment, :commentable_id)
  end

  test "should have a commentable_type" do
    check_presence(@comment, :commentable_type)
  end
end

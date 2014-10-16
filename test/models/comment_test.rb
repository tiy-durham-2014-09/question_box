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

  #I am not sure how to properly test a polymorphic association
  test "should belong to a commentable" do
  end
end

require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  setup do
    @comment = Comment.new
  end

  test "should contain text" do
    check_presence(@comment, :text)
  end

  test "should belong to user" do
    check_presence(@comment, :user)
  end

end

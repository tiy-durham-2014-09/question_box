require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  setup do
    @comment = Comment.new
  end

  test "should have a user" do
    check_presence(@comment, :user)
  end

  test "should have text" do
    check_presence(@comment, :text)
  end

  test "should have date" do
    check_presence(@comment, :date)
  end

end

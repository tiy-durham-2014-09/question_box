require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	setup do
		@comment = Comment.new
	end

	test "should have text" do
		check_presence(@comment, :text)
	end

  # not sure if the below tests are needed

	test "should belong to a user" do
		check_presence(@comment, :user)
  end

	test "should belong to commentable" do
		check_presence(@comment, :commentable_id)
		check_presence(@comment, :commentable_type)
	end

end

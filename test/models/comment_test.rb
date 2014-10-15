require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	setup do
		@comment = Comment.new
	end

	test "should have a date" do
		check_presence(@comment, :date)
	end

	test "should have text" do
		check_presence(@comment, :text)
	end

	test "should belong to a user" do
		check_presence(@comment, :user_id)
	end

end

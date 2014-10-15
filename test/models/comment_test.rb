require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	setup do
		@comment = Comment.new
	end

	test "should have a date" do
		check_presence(@comment, :date)
	end

	# test "date should be in the past" do
	# 	assert (:date, on_or_before: lambda { Date.current }, message: "This is an invalid date.")
	# end
	#
	test "should have text" do
		check_presence(@comment, :text)
	end

	test "should belong to a user" do
		check_presence(@comment, :user_id)
	end

	test "should have a commentable id" do
		check_presence(@comment, :commentable_id)
	end

end

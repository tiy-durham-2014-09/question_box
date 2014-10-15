require 'test_helper'

class VoteTest < ActiveSupport::TestCase

	setup do
		@vote = Vote.new
	end

	test "vote has a value" do
		check_presence(@vote, :value)
	end

	test "should include only 1 or -1" do
		@vote.value = 2
		assert @vote.invalid?, "Votes are up or down"
		assert_not_empty @vote.errors[:value]
	end

	# test "should add 10 pts to user score when user answer or question is voted up" do
	# 	current_score = @user.score
	#
	# end

	# test "should subtract 5 pts from user score when user answer or question is voted down" do
	#
	# end
	#
	# test "should subtract 1 pt from user score when user votes down other_user answer or question" do
	#
	# end
end

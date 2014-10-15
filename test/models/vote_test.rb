require 'test_helper'

class VoteTest < ActiveSupport::TestCase
	setup do
		@vote = Vote.new
	end

	test "should have an up field" do
		check_presence(@vote, :up)
	end

	test "should belong to a user" do
		check_presence(@vote, :user)
	end

	test "should belong to votable" do
		check_presence(@vote, :voteable_id)
		check_presence(@vote, :voteable_type)
	end

	test "should award its user 100 points when chosen" do
		vote = @vote

		assert_difference 'user.score', 10 do
			vote.update(value: true)
		end
	end

end

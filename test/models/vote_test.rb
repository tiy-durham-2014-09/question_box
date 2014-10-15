require 'test_helper'

class VoteTest < ActiveSupport::TestCase

	setup do
		@vote = Vote.new
	end

	test "vote exists" do
		check_presence(@vote, :value)
	end

	test "equals 1 or -1" do
		if @vote=1 || @vote=-1
			assert @vote.valid?, "votes should be positive or negative"
			assert_not_empty @vote.errors[value]
		end
	end

end

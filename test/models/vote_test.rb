require 'test_helper'

class VoteTest < ActiveSupport::TestCase
 setup do
   @vote = Vote.new
 end

test "should belong to a user" do
  check_presence(@vote, :user)
 end

 test "should have a positive or negative value" do
   check_presence(@user, :score)
 end
 # test "should add 10 pionts to user when positive vote received" do
 # end
 # test "should subtract 5 pionts from user when negative vote recieved" do
 # end
 # test "should subtract 1 pionts from user when making a negative vote" do
 # end

end

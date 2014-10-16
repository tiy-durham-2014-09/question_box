require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # setup do
  #   @tag = Tag.new
  # end

  test "should have a name" do
    check_presence(@tag, :name)
  end

  should validate_presence_of :name
  should have_and_belong_to_many :questions

end

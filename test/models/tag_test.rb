require 'test_helper'

class TagTest < ActiveSupport::TestCase

  setup do
    @tag = Tag.new
  end

  test "should have a name" do
    check_presence(@tag, :name)
  end

  # test "should have a unique name"
  # test "should belong to a tagable"
end


require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "test if tag has a name" do
    t = tags(:one)
    assert t.name, "All tags must have a name"
  end

  test "test if tag has one or more questions" do
    t = tags(:one)
    assert t.question_id, "All tags mush have one or more questions"
  end
end

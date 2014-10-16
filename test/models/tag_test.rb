<<<<<<< HEAD

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
=======
require 'test_helper'

class TagTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should have_and_belong_to_many :questions
>>>>>>> 4e14ee86f08850174ea95e735c3cc01ea453a7c1
end

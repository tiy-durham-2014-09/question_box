ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def check_presence(model, field)
    assert model.invalid?, "#{model.class} without #{field} should not be valid"
    assert_not_empty model.errors[field]
  end
end


def has_voted_true?
  answers.where(value: true).count + 1
end

def has_voted_false?
  answers.where(value: false).count - 1
end

def add_ten_points # If vote value is true 10 points are added to score
  if has_voted_true?
    user.question.score += 10
  end
end

def subtract_five_points # If vote value is false 5 points are subtracted from score
  if has_voted_false?
    user.question.score -= 10
    @current_user.score -= 1
  end
end

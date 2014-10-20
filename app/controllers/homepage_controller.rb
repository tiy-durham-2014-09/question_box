class HomepageController < ApplicationController
  def index
    @questions = Question.all
  end
end

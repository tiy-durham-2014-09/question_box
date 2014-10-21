class HomepageController < ApplicationController
  def index
    @question = Question.all
    @questions1 = Question.all
  end
end

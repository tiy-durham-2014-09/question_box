require 'test_helper'

class TagsTest < ActionDispatch::IntegrationTest
  context "Tags" do
    setup do
      @tag = tags(:one)
      @questions = @tag.questions
      visit tag_path(@tag)
    end

    should "be able to view an individual tag page" do
      assert page.has_content?(@tag.name)
      assert page.has_content?(@questions.first.title)
    end

    should "be able to click question and go to question show page" do
      click_on @questions.first.title

      assert_equal current_path, question_path(@questions.first.id)
    end
  end
end

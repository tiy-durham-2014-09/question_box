require 'test_helper'

class QuestionsTest < ActionDispatch::IntegrationTest
  context "Questions" do
    should "be able to view an individual question" do
      question = questions(:one)

      visit question_path(question)

      assert page.has_content?(question.title)
      assert page.has_content?(question.text)
    end

    context "when logged in" do
      setup do
        login
      end

      should "be able to create a question" do
        title = "How do I?"
        text = "I don't even know"

        visit root_path
        fill_in "question_title", with: title
        fill_in "question_text", with: text
        click_on "Ask"

        assert page.has_content?("question has been created")
        assert page.has_content?(title)
        assert page.has_content?(text)
      end

      should  "be able to see a question's tags" do
        login
        title = "Where do I go?"
        text = "Not sure"
        tag = "tag,"

        visit root_path

        fill_in "question_title", with: title
        fill_in "question_text", with: text
        fill_in "question_tag_list_tag", with: tag
        click_on "Ask"

        assert page.has_content?("tag")
      end
      
    end
  end
end

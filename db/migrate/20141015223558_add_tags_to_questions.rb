class AddTagsToQuestions < ActiveRecord::Migration
  def change
	  add_reference :questions, :tag, index: true
  end
end

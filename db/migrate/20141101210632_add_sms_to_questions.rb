class AddSmsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :sms, :boolean
  end
end

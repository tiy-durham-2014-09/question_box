class RemoveSmsFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :sms, :boolean
  end
end

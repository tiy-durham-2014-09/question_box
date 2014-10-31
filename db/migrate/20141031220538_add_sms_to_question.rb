class AddSmsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :SMS, :boolean
  end
end

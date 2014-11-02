class AddFalseDefaultValueToSms < ActiveRecord::Migration
  def up
    change_column :questions, :sms, :boolean, :default => false
  end

  def down
    change_column :questions, :sms, :boolean, :default => nil
  end
end
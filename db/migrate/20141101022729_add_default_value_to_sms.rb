class AddDefaultValueToSms < ActiveRecord::Migration
  def up
    change_column :questions, :SMS, :boolean, :default => false
  end

  def down
    change_column :questions, :SMS, :boolean, :default => nil
  end
end

class AddDefaultValueToSms < ActiveRecord::Migration
  def up
    change_column :questions, :SMS, :boolean, :default => true
  end

  def down
    change_column :questions, :SMS, :boolean, :default => nil
  end
end

class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :is_positive
      t.references :user, index: true

      t.timestamps
    end
  end
end

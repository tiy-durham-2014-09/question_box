class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, index: true
      t.references :question, index: true
      t.references :answer, index: true
      t.references :voteable, index: true, polymorphic: true

      t.timestamps
    end
  end
end

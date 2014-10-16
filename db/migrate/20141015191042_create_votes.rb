class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :voteable, :polymorphic => true
      t.integer :score

      t.timestamps
    end
  end
end

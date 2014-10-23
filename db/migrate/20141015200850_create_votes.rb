class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.integer :voteable_id
      t.string :voteable_type
      t.integer :value

      t.timestamps
    end
    add_index :votes, [:voteable_id, :voteable_type]
  end
end

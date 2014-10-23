class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.text :content
      t.integer :commentable_id
      t.string :commentable_type
      t.string :string

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end

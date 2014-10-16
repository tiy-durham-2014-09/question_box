class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :commentable, index: true, polymorphic: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

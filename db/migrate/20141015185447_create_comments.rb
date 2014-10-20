class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :date
      t.text :text
      t.references :user, index: true

      t.timestamps
    end
  end
end

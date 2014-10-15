class MakeVotesAndCommentsPolymorphic < ActiveRecord::Migration
  def change

    remove_column :votes, :voteable_id
    change_table :votes do |t|
      t.references :voteable, polymorphic: true, index: true
    end

    remove_column :comments, :commentable_id
    change_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
    end
  end
end

class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_join_table :questions, :tags
    create_join_table :users, :tags
  end
end

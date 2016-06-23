class CreateSubreddits < ActiveRecord::Migration[5.0]
  def change
    create_table :subreddits do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :name
      t.timestamps
    end
  end
end

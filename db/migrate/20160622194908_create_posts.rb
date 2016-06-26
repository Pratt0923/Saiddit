class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :subreddit_id
      t.integer :user_id
      t.string :posted_by
      t.timestamps
    end
  end
end

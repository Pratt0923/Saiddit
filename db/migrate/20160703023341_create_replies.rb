class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.string :user
      t.string :content
      t.integer :comment_id
      t.timestamps
    end
  end
end

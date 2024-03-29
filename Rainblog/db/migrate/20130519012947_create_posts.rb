class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.datetime :published_at
      t.references :user

      t.timestamps
    end
    add_index :posts, :user_id
  end
end

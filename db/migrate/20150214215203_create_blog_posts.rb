class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

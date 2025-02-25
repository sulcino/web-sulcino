class CreateBlogPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :blog_posts do |t|
      t.text :text_en
      t.text :text_cs
      t.text :title_en
      t.text :title_cs
      t.text :preview_text_en
      t.text :preview_text_cs
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

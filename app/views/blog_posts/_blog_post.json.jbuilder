json.extract! blog_post, :id, :text_en, :text_cs, :title_en, :title_cs, :preview_text_en, :preview_text_cs, :user_id, :created_at, :updated_at
json.url blog_post_url(blog_post, format: :json)

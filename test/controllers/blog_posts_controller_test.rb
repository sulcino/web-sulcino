require "test_helper"

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_post = blog_posts(:one)
  end

  test "should get index" do
    get blog_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_post_url
    assert_response :success
  end

  test "should create blog_post" do
    assert_difference("BlogPost.count") do
      post blog_posts_url, params: { blog_post: { preview_text_cs: @blog_post.preview_text_cs, preview_text_en: @blog_post.preview_text_en, text_cs: @blog_post.text_cs, text_en: @blog_post.text_en, title_cs: @blog_post.title_cs, title_en: @blog_post.title_en, user_id: @blog_post.user_id } }
    end

    assert_redirected_to blog_post_url(BlogPost.last)
  end

  test "should show blog_post" do
    get blog_post_url(@blog_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_post_url(@blog_post)
    assert_response :success
  end

  test "should update blog_post" do
    patch blog_post_url(@blog_post), params: { blog_post: { preview_text_cs: @blog_post.preview_text_cs, preview_text_en: @blog_post.preview_text_en, text_cs: @blog_post.text_cs, text_en: @blog_post.text_en, title_cs: @blog_post.title_cs, title_en: @blog_post.title_en, user_id: @blog_post.user_id } }
    assert_redirected_to blog_post_url(@blog_post)
  end

  test "should destroy blog_post" do
    assert_difference("BlogPost.count", -1) do
      delete blog_post_url(@blog_post)
    end

    assert_redirected_to blog_posts_url
  end
end

require "application_system_test_case"

class BlogPostsTest < ApplicationSystemTestCase
  setup do
    @blog_post = blog_posts(:one)
  end

  test "visiting the index" do
    visit blog_posts_url
    assert_selector "h1", text: "Blog posts"
  end

  test "should create blog post" do
    visit blog_posts_url
    click_on "New blog post"

    fill_in "Preview text cs", with: @blog_post.preview_text_cs
    fill_in "Preview text en", with: @blog_post.preview_text_en
    fill_in "Text cs", with: @blog_post.text_cs
    fill_in "Text en", with: @blog_post.text_en
    fill_in "Title cs", with: @blog_post.title_cs
    fill_in "Title en", with: @blog_post.title_en
    fill_in "User", with: @blog_post.user_id
    click_on "Create Blog post"

    assert_text "Blog post was successfully created"
    click_on "Back"
  end

  test "should update Blog post" do
    visit blog_post_url(@blog_post)
    click_on "Edit this blog post", match: :first

    fill_in "Preview text cs", with: @blog_post.preview_text_cs
    fill_in "Preview text en", with: @blog_post.preview_text_en
    fill_in "Text cs", with: @blog_post.text_cs
    fill_in "Text en", with: @blog_post.text_en
    fill_in "Title cs", with: @blog_post.title_cs
    fill_in "Title en", with: @blog_post.title_en
    fill_in "User", with: @blog_post.user_id
    click_on "Update Blog post"

    assert_text "Blog post was successfully updated"
    click_on "Back"
  end

  test "should destroy Blog post" do
    visit blog_post_url(@blog_post)
    click_on "Destroy this blog post", match: :first

    assert_text "Blog post was successfully destroyed"
  end
end

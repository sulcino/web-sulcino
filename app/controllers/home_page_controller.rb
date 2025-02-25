class HomePageController < ApplicationController
  def index
    @current_user = current_user
    @last_blog_posts = BlogPost.order(updated_at: :asc).last(2)
  end
end

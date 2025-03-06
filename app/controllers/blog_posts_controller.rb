class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  def index
    @tags = Tag.all
    @selected_tag_ids = []

    if params[:tag_ids].present?
      @selected_tag_ids = params[:tag_ids].map(&:to_i).reject(&:zero?)
    end

    @blog_posts = if @selected_tag_ids.any?
      # Find posts that have ALL selected tags
      BlogPost.joins(:tags)
              .where(tags: { id: @selected_tag_ids })
              .group("blog_posts.id")
              .having("COUNT(DISTINCT tags.id) = ?", @selected_tag_ids.size)
    else
      BlogPost.all
    end
  end

  def show
  end

  def new
    @blog_post = BlogPost.new(user: current_user)
  end

  def edit
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to @blog_post, notice: "Blog post was successfully created." }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to @blog_post, notice: "Blog post was successfully updated." }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog_post.destroy!

    respond_to do |format|
      format.html { redirect_to blog_posts_path, status: :see_other, notice: "Blog post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_blog_post
      @blog_post = BlogPost.find(params.expect(:id))
    end

    def blog_post_params
      prms = params.expect(blog_post: [ :text_en, :text_cs,
                                        :title_en, :title_cs,
                                        :preview_text_en, :preview_text_cs,
                                        :user_id, tag_ids: [] ])
      prms[:user_id] = current_user.id if prms[:user_id].blank?
      prms
    end
end

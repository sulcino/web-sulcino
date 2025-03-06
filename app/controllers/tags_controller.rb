class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path, notice: "Tag was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "Tag was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: "Tag was successfully destroyed."
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def require_admin
    redirect_to root_path unless current_user&.admin?
  end
end

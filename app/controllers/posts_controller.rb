class PostsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :require_owner, only: [:edit, :update, :destroy]

  def new
    @region = find_region
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.region = find_region
    @region = @post.region

    if @post.save
      redirect_to [@region, @post]
    else
      render :new
    end
  end

  def show
    post
  end

  def edit
    post
  end

  def update
    if post.update(post_params)
      redirect_to [post.region, post]
    else
      render :edit
    end
  end

  def destroy
    post.delete

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :image, category_ids: [])
  end

  def find_region
    Region.find(params[:region_id])
  end

  def require_owner
    post

    unless post.owned_by?(current_user) || current_user.admin?
      raise User::NotAuthorized
    end
  end

  def post
    @post ||= Post.find(params[:id])
  end
end

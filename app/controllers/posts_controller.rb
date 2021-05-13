class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def create
    @community = Community.find(params[:community_id])
    @post = Post.new(post_params)
    @post.community = @community
    @post.user = current_user

    if @post.save
      redirect_to community_path(@community)
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

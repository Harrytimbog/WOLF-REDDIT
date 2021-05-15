class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: [:show]
  before_action :auth_subscriber, only: [:new]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
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
    @post = Post.includes(:comments).find(params[:id])
  end

  def auth_subscriber
    unless Subscription.where(community_id: params[:community_id], user_id: current_user.id).any?
      redirect_to root_path, flash: { danger: "You are not authorized to view this page" }
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

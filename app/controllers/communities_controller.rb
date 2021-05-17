class CommunitiesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_community, only: [:show]

  def index
    @communities = Community.all
  end

  def show
    @posts = @community.posts.limit(20).sort_by { |p| p.score }.reverse
    @subscriber_count = @community.subscribers.count
    @is_subscribed = user_signed_in? ? Subscription.where(community_id: @community.id, user_id: current_user.id).any? : false
    @subscription = Subscription.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.user = current_user

    if @community.save
      redirect_to communities_path
    else
      render :new
    end
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name, :url, :summary, :rules)
  end
end

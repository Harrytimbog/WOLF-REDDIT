class CommunitiesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_community, only: [:show]

  def index
    @communities = Community.all
  end

  def show
    @posts = @community.posts
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
    params.require(:community).permit(:name, :url, :rules)
  end
end

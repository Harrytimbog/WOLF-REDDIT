class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @communities = Community.all.limit(5)
    @posts = Post.limit(20).sort_by { |p| p.score }.reverse
  end

  def profile
    @profile = current_user # User.find_by_username(params[:username])
    @posts = @profile.posts
  end
end

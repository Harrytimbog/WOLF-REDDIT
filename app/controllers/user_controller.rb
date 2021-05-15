class UserController < ApplicationController
  def profile
    @profile = User.find_by_username(params[:username])
    @posts = @profile.posts
  end
end

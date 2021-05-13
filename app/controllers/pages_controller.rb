class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @communities = Community.all.limit(5)
    @posts = Post.order(id: :desc).limit(20)
  end
end

class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @micro_post = current_user.micro_posts.build
      @micro_posts = current_user.feed_micro_posts.order('created_at DESC').page(params[:page])
    end
  end
end

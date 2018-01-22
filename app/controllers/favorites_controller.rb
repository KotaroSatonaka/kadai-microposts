class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micro_post = MicroPost.find(params[:micro_post_id])
    current_user.favorite(micro_post)
    flash[:success] = 'MicroPost をお気に入りしました。'
    redirect_to current_user
  end

  def destroy
    micro_post = MicroPost.find(params[:micro_post_id])
    current_user.unfavorite(micro_post)
    flash[:success] = 'MicroPost のお気に入りを解除しました。'
    redirect_to current_user
  end
end

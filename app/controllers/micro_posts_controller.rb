class MicroPostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @micro_post = current_user.micro_posts.build(micro_post_params)
    if @micro_post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @micro_posts = current_user.micro_posts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @micro_post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def micro_post_params
    params.require(:micro_post).permit(:content)
  end
  
  def correct_user
    @micro_post = current_user.micro_posts.find_by(id: params[:id])
    unless @micro_post
      redirect_to root_url
    end
  end
end

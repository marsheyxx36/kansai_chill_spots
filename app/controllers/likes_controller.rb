class LikesController < ApplicationController
  before_action :post_params
  def create
    Like.create(user_id: current_user.id, post_id: params[:id])
    # redirect_to post_path(@post)
  end

  def destroy
    @like = Like.find_by(post_id: @post.id, user_id: current_user.id).destroy
    #  redirect_to post_path(@post)
  end

  def post_params
    @post = Post.find(params[:id])
  end
end

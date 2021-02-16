class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
  end  

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to(root_path)
  end

  def show
      @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:name,:description,:address, :image,:latitude,:longitude).merge(user_id: current_user.id)
  end
end
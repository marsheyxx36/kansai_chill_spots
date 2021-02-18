class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.all
  end  

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if  @post.valid?
      @post.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
      @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:name,:description,:address, :image,:latitude,:longitude).merge(user_id: current_user.id)
  end
end
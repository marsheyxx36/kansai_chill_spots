class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.all
    @parents = Area.all.limit(6)
  end

  def new
    @post = Post.new
    @category_parent_array = ['---']
    Area.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.valid?
      @post.save
      redirect_to(root_path)
    else
      # redirect_to(new_post_path(@post))
      # @post = Post.new(post_params)
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post =  Post.find(params[:id])
  end

  def update
    @post =  Post.find(params[:id])
    if @post.update(post_params)
      redirect_to(post_path(@post))
    else
      @post = Post.find(params[:id])
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to(root_path)
    else
      redirect_to(post_path(@post))
    end
  end

  def get_category_children
    @category_children = Area.find(params[:parent_id].to_s).children
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :address, :image, :latitude, :longitude, :area_id,
                                 :prefecture_id).merge(user_id: current_user.id)
  end
end

class UsersController < ApplicationController
  # マイページ
  def show
    @user = User.find(params[:id])
    user = current_user
    @posts = @user.posts
    @favorite = @user.likes
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  # 自分がフォローしているユーザー一覧
  def following
    @user = User.find(params[:user_id])
    @followings = @user.following_user.where.not(id: current_user.id)
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = User.find(params[:user_id])
    @followers = @user.follower_user.where.not(id: current_user.id)
  end

  def edit_password
    @password = current_user
  end

  def update_password
    @password = current_user
    if @password.update(user_params)
      redirect_to root_path
    else
      render 'edit_password'
    end
  end

  def following
    # @userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    # @userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:id, :nickname, :image, :profile, :password, :password_confirmation, :current_password)
  end
end

class UsersController < ApplicationController
  # マイページ
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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

  def user_params
    params.require(:user).permit(:id, :nickname, :image, :profile)
  end

end

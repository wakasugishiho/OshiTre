class UsersController < ApplicationController
  def show
    @new_post = Post.new
  	@user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @new_post = Post.new
  	@user = User.find(params[:id])
  end

  def update
    @new_post = Post.new
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :emai, :phone_number, :image)
  end
end

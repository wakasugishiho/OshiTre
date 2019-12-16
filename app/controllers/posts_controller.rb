class PostsController < ApplicationController

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.save
  	redirect_to posts_path
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def index
  	@posts = Post.all
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to user_path(current_user)
  end



  private

  def post_params
  	params.require(:post).permit(:title, :image, :body)
  end
end

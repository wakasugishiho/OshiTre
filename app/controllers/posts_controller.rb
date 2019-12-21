class PostsController < ApplicationController
  before_action :authenticate_user!


  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.save
  	redirect_to posts_path
  end

  def show
    @user = current_user
    @new_post = Post.new
  	@post = Post.find(params[:id])
    @room = Room.new
  end

  def edit
    @new_post = Post.new
  	@post = Post.find(params[:id])
  end

  def index
    @new_post = Post.new
  	@posts = Post.all.order(id: "DESC")
    @user = current_user
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to user_path(current_user)
  end

  def hashtag

    @new_post = Post.new
    @user = current_user
    @hashtag = Hashtag.find_by(hashname: params[:name])
    @posts = @hashtag.posts
  end



  private

  def post_params
  	params.require(:post).permit(:title, :image, :body)
  end
end
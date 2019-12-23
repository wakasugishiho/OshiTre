class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@room = Room.new(room_params)
  	@room.save
  	redirect_to room_path(@room)
  end

  def show
    @new_post = Post.new
    @user = current_user
  	@room = Room.find(params[:id])
    @post = @room.post
  	@messages = @room.messages
  end

  def index
    @new_post = Post.new
    @user = current_user
    @rooms = Room.all.page(params[:page]).per(10)
    # @rooms = Room.joins(:messages).where(messages: {sent_user: current_user})
  end


  private

  def room_params
  	params.require(:room).permit(:post_id)
  end
end

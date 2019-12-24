class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only:[:show]

  def create
  	@room = Room.new(room_params)
  	@room.save
  	redirect_to room_path(@room)
  end

  def show
    @new_post = Post.new
   #  @user = current_user
  	# @room = Room.find(params[:id])
    @post = @room.post
  	# @messages = @room.messages
  end

  def index
    @new_post = Post.new
    @user = current_user
    @rooms = @user.rooms.page(params[:page]).per(10)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end


  private

  def room_params
  	params.require(:room).permit(:post_id)
  end

  def check_user
    @user = current_user
    @room = Room.find(params[:id])
    @messages = @room.messages
    # @messages.each do |message|
    #   if message.sent_user != current_user
    #     redirect_to rooms_path
    #   end
    # end
  end

end

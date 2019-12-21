class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@room = Room.new(room_params)
  	@room.save
  	redirect_to room_path(@room)
  end

  def show
  	@room = Room.find(params[:id])
  	@messages = @room.messages
  end

  def index
  	@rooms = Room.all
  end


  private

  def room_params
  	params.require(:room).permit(:post_id)
  end
end

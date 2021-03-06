class ChatroomsController < ApplicationController

  def index
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save!
      redirect_to myroom_post_path(current_user.id)
    else
      render :new
    end
  end

  private
  def chatroom_params
    params.require(:chatroom).permit(:room_name,user_ids: [])
  end
end

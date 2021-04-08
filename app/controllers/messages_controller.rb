class MessagesController < ApplicationController
  def new
    @message = Message.new
    @room = Chatroom.find(params[:chatroom_id])
    @messages = @room.messages.includes(:user)
    # binding.pry
  end
  
  def create
    @message = Message.new(text: params[:message][:text], user_id: current_user.id, chatroom_id: params[:chatroom_id])
    if @message.save!
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end
  
end

class EventsController < ApplicationController

  # def new
  #   @posts = Post.where(user_id: params[:id])
  #   @event = Event.new
  #   @events = Event.where(user_id: @posts.ids)
  # end

  def create
    event = Event.new(event_params)
    event.save!
    @events = Event.where(user_id: current_user.id)
  end

  def update
      event = Event.find(params[:id])
      @events = Event.where(user_id: current_user.id)
      event.update(event_params)
  end
  
  def destroy
      @user = User.find(params[:id])
      event = Event.find(params[:id])
      event.destroy
      redirect_to user_path(@user)
  end
  
  private
  def event_params
      params.require(:event).permit(:title, :start, :end, :user_id, :body)
  end
end

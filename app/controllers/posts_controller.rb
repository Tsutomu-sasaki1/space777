class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def myroom
    @posts = Post.where(user_id: params[:id])
    @events = Event.where(user_id: @posts.ids)
    @event = Event.new
    # binding.pry
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
    # binding.pry
  end
  
  def search
    @posts = Post.search(params[:keyword])
  end

end

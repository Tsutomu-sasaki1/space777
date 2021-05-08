class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def myroom
    @post = Post.find_by(user_id: params[:id])
    @posts = Post.where(user_id: params[:id])
    @events = Event.where(user_id: @post.id)
    @event = Event.new
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    @user = User.find(params[:id])
  end
  
  def search
    @posts = Post.search(params[:keyword])
  end

end

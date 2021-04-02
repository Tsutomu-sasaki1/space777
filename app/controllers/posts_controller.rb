class PostsController < ApplicationController

  def myroom
    @posts = Post.where(user_id: params[:id])
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def search
    @posts = Post.search(params[:keyword])
  end

end

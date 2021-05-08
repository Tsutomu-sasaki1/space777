class UsersController < ApplicationController

  def show
    if @post = Post.find(params[:id])
      render 'show'
    else
       @user = User.find(params[:id])
    end
  end
  
  def following
    @user  = Post.find(params[:id])
    @users = @user.user.followings
    render 'show_follow'
  end
  
  def followers
    @user  = Post.find(params[:id])
    @users = @user.user.followers
    render 'show_follower'
  end
end

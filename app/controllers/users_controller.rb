class UsersController < ApplicationController

  def show
    if @post = Post.find(params[:id]) 
      render 'show'
    else
       @user = User.find(params[:id])
    end
  end
  
  def following
    @user  = User.find(params[:id]) #|| Post.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end
  
  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end

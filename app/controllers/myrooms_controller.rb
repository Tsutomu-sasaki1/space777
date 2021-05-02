class MyroomsController < ApplicationController


  def index
    @posts = Post.all
    chatroom = Chatroom.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to controller: :posts, action: :index
    else
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end
  
end

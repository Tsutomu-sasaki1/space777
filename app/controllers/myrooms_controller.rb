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
    @post = Post.find(params[:id])
    # binding.pry
    # @posts = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to myroom_post_path(@post.user.id)
    else
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to myroom_post_path(@post.user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end
  
end

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      # render the form again
    end
  end

  def edit
    # @post = Post.where(id:params[:id]).first
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.where(id: params[:id]).first
    if @post.update(post_params)
      redirect_to posts_path
    else
      # render the form again
    end  
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

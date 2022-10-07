class PostsController < ApplicationController
  before_action :find_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      redirect_to @post, notice: "Post created successfully!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    authorize @post
  end
  def update
    find_post
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path, notice: "Post deleted successfully!"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

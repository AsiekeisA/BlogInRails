class PostsController < ApplicationController
  before_action :find_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorized, only: [:create, :new, :update, :edit, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post created successfully!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end
  def update
    find_post
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted successfully!"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def authorized
    redirect_to posts_path, notice: "Not authorized to manage posts" unless current_user.id == 1
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

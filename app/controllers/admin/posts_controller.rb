class Admin::PostsController < AdminController
  before_action :find_post, only: %i[ edit update destroy show]
  before_action :authenticate_user!

  # def index
  #   @posts = Post.all
  # end

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
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "my_blog_post#{@post.id}", template: "admin/posts/post", layout: "pdf", formats: [:html], encoding:"UTF-8"   # Excluding ".pdf" extension.
      end
    end

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
    params.require(:post).permit(:title, :content, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end

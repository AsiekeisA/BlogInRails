class Admin::CommentsController < AdminController
  before_action :find_post
  before_action :authenticate_user!

  # def create
  #   @comment = @post.comments.new(comment_params)
  #   if @comment.save
  #     redirect_to post_path(@post), notice: "Comment created successfully!"
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @comment = @post.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to post_path(@post), status: :see_other, notice: "Comment deleted successfully!"
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :content)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end

class CommentsController < ApplicationController
  before_action :find_post
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :content)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end

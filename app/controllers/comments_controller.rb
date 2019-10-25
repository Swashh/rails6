class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Post successfully created"
      redirect_to @commentable
    else
      flash[:notice] = "Can't be empty"
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

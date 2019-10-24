class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    respond_to do |format|
      format.html {redirect_to @commentable, notice: "Your comment was successfully posted."}
      format.js
      # redirect_to @commentable, notice: "Your comment was successfully posted."
    end
    end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

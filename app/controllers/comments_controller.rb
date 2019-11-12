# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Post successfully created'
      redirect_to @commentable
    else
      flash[:notice] = "must contain two words(mininmum 2 symbols) and '.', first word start with capital lettercd before() do

      end"
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

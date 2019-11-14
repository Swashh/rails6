# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Post successfully created'
      redirect_to @commentable
    else
      flash[:notice] = "must contain two words(minimum 2 symbols) and '.', first word start with capital letter before() do

      end"
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

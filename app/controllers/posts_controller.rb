# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :post_data, only: %i[show edit update destroy]
  #before_action :category_post, only: %i[destroy]

  def index
    @post = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
  end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to @category
  end

  private

  def post_data
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :category_id, :image)
  end
end

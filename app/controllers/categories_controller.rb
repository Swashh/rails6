# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_data, only: %i[show edit update destroy]

  def index
    @category = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
      end
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_data
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :text)
  end
end

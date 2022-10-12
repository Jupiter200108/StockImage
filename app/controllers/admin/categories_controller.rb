class Admin::CategoriesController < ApplicationController
  def index
    @category   = Category.new
    @categories  = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to request.referer
    else
      @category   = Category.new
      @categories  = Category.all
      render :index
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      redirect_to edit_admin_category_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
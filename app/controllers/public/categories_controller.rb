class Public::CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = @category.items.where(is_active: true).page(params[:page]).per(50)
  end
end

class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @items = Item.page(params[:page]).per(80)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      @item = Item.find(params[:id])
      redirect_to　edit_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :genre_id, :name, :introduction, :contents_status, :content, :is_active)
  end
end

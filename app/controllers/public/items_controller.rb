class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      @item = Item.new
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      @item = Item.find(params[:id])
      redirect_to　edit_item_path
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:category_id, :genre_id, :name, :introduction, :contents_status, :content)
  end
end

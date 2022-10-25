class Public::ItemsController < ApplicationController
  before_action :authenticate_end_user!, except: [:show, :index]

  def new
    @item = Item.new
    @items = current_end_user.items.all
  end

  def create
    @item = Item.new(item_params)
    @item.end_user_id = current_end_user.id
    if @item.save!
       @items = current_end_user.items.all
    else
      @item = Item.new
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.page(params[:page]).per(80)
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

  def download
    item = Item.find(params[:id]).content
    data = item.download
    if item.content_type.include?('image/')
      send_data(data, type: 'image/', filename: 'download.jpg')
    else
      send_data(data, type: 'video/', filename: 'download.mp4')
    end

  end


  private

  def item_params
    params.require(:item).permit(:end_user_id, :category_id, :genre_id, :name, :introduction, :price, :contents_status, :content, :is_active)
  end
end

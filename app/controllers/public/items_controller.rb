class Public::ItemsController < ApplicationController
  before_action :authenticate_end_user!, except: [:show, :index]

  def new
    @item = Item.new
    @items = current_end_user.items.includes(:content_blob).order("created_at DESC").page(params[:page]).per(12)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.includes(:content_blob).where(is_active: true).page(params[:page]).per(50)
  end

  def edit
    @item = Item.find(params[:id])
    require_permission(@item)
  end

  def create
    @item = Item.new(item_params)
    @item.end_user_id = current_end_user.id
    if @item.save
      if @item.content.content_type.include?("image/")
        tags = Vision.get_image_data(@item.content)
        tags.each do |tag|
          @item.tags.create(name: tag)
        end
      end
      @items = current_end_user.items.includes(:content_blob).order("created_at DESC").page(params[:page]).per(12)
    else
      @item = Item.new
      render :new
    end
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
    if item.content_type.include?("image/")
      send_data(data, type: "image/", filename: "download.jpg")
    else
      send_data(data, type: "video/", filename: "download.mp4")
    end
  end


  private
    def item_params
      params.require(:item).permit(:end_user_id, :category_id, :genre_id, :name, :introduction, :price, :contents_status, :content, :is_active)
    end

    def require_permission(item)
      unless item.end_user == current_end_user
        redirect_to root_path, alert: "ここから先は管理者限定です！"
      end
    end
end

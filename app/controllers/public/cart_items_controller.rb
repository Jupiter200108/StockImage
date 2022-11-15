class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @cart_items = current_end_user.cart_items.includes(item: :content_blob)
    @total_payment = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_end_user.cart_items.includes(:item, :content_attachment)
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = current_end_user.cart_items.new(cart_item_params)

    @cart_item.save
    redirect_to :cart_items
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :end_user_id)
    end
end

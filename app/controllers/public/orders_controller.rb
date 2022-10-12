class Public::OrdersController < ApplicationController
  def new
    if current_end_user.cart_items.count != 0
      @order = Order.new
      @name = current_end_user.name
      @cart_items=current_end_user.cart_items.all
    else
      redirect_to root_path
    end
  end

  def index
    @orders = Order.page(params[:page]).per(6)
  end

  def show
    @order = current_end_user.orders.find(params[:id])
    @order_details=@order.order_details.all
  end

  def thanks
  end

  def confirm
    if current_end_user.cart_items.count != 0
      @order = Order.new(order_params)
      @cart_items = current_end_user.cart_items
      @order_new = Order.new
    else
      redirect_to root_path
    end
    @order.save
    @cart_items = current_end_user.cart_items
    @order_new = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_end_user.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.item.price
        @order_details.order_id =@order.id
        @order_details.amount = cart_item.amount
        @order_details.save
      end
      current_end_user.cart_items.destroy_all
      redirect_to orders_thanks_path

  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :name, :total_payment)
  end
end

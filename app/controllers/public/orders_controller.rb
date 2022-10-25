class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def new
    if current_end_user.cart_items.count != 0
      @order = Order.new
      @name = current_end_user.name
      @cart_items=current_end_user.cart_items.all
      @total_payment = 0
    else
      redirect_to root_path
    end
  end

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    if params[:id] == "confirm"
      redirect_to root_path
      return
    end
    @order = current_end_user.orders.find(params[:id])
    @order_details=@order.order_details.all
  end

  def thanks
  end

  def confirm
    @total_payment = 0
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
    pp Order.new, order_params
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_end_user.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.item.price
        @order_details.order_id =@order.id
        @order_details.save
      end
      current_end_user.cart_items.destroy_all
    redirect_to orders_thanks_path

  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :price, :payment_method, :total_payment)
  end
end

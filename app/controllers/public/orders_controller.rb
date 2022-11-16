class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!

  def new
    if current_end_user.cart_items.count != 0
      @order = Order.new
      @cart_items = current_end_user.cart_items.includes(:item)
      @total_payment = 0
    else
      redirect_to root_path
    end
  end

  def index
    @orders = current_end_user.orders.includes(order_details: :item).page(params[:page]).per(10)
  end

  def show
    if params[:id] == "confirm"
      redirect_to root_path
      return
    end
    @order = current_end_user.orders.find(params[:id])
    @order_details = @order.order_details.includes(:item)
  end

  def thanks
  end

  def confirm
    @total_payment = 0
    if current_end_user.cart_items.count != 0
      @order = Order.new(order_params)
      @cart_items = current_end_user.cart_items
    else
      redirect_to root_path
    end
    @cart_items = current_end_user.cart_items.includes(item: :content_blob)
  end

  def create
    @order = current_end_user.orders.new(order_params)
    if @order.save
      @order.create_order_details(current_end_user)
      redirect_to orders_thanks_path
    else
      render :new
    end
  end

  private
    def order_params
      params.require(:order).permit(:end_user_id, :price, :payment_method, :total_payment)
    end
end

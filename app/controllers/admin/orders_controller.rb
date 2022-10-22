class Admin::OrdersController < ApplicationController
  def show
     @order = Order.find(params[:id])
     @order_details= @order.order_details
  end

  def index
    @orders = Order.page(params[:page]).per(10)
  end
  
  def update
    @order= Order.find(params[:id])
    @order_details= @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :total_payment)
  end
end

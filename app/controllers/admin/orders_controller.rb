class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes(:item)
  end

  def index
    @orders = Order.includes(:end_user).page(params[:page]).per(10)
  end

  private
    def order_params
      params.require(:order).permit(:end_user_id, :total_payment)
    end
end

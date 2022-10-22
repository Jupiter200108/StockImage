class Admin::OrderDetailsController < ApplicationController
  def update
    @order_details=OrderDetail.find(params[:id])
    @order= @order_details.order
  end
  
  private
  
  def order_details_params
    params.require(:order_detail).permit(:order_id, :item_id)
  end
end

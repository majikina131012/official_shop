class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    
    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: :preparing_ship) if @order_detail.preparation_status == "finish"
      @order_details.each do |order_detail|
        if order_detail.preparation_status != "shipping_completed" 
          is_updated = false 
        end
      end
      @order.update(status: :finish_prepare) if is_updated
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:preparation_status)
  end
  
end

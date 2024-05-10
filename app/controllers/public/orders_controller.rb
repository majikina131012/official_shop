class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_cart_items, only: [:new, :confirm, :create, :error]

  def new
    @order = Order.new
  end
  
  def index
    @orders = current_customer.orders
  end

  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.name
    @order.postage = 300
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 300
    @order.billing_amount = @order.postage + @cart_items.sum(&:subtotal)
    if @order.save
      @order.create_order_details(current_customer)
      redirect_to orders_thanks_path
    else
      render :new
    end
  end
  
  def show
    @order = current_customer.orders.find(params[:id])
    @order_details = @order.order_details
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

  def ensure_cart_items
    @cart_items = current_customer.cart_items
    redirect_to items_path if @cart_items.empty?
  end
end

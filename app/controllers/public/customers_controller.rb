class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to mypage_path
  end

  def check
    @customer = current_customer
  end

  def destroy
    customer = current_customer
    customer.destroy
    redirect_to root_path
  end  

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :email, :postal_code, :address)
  end
end

class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer, only: [:edit, :update]
  
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
  
  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to mypage_path
    end
  end
  
end

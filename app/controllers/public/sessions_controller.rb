# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    mypage_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  # end

  # def reject_customer
  # @customer = Customer.find_by(email: parms[:customer][:email])
  # if @customer
  #   if @customer.valid_password?(params[:customer][:password]) && !@customer.is_deleted
  #     flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
  #     redirect_to new_customer_registration_path
  #   else
  #     flash[:notice] = "項目を入力してください"
  #   end
  # else
  #   flash[:notice] = "該当するユーザーが見つかりません"
  # end
  # end

  # If you have extra params to permit, append them to the sanitizer.
end

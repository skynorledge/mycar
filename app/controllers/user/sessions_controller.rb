# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]


  protected

    def after_sign_in_path_for(_resource)

      mypage_path(@user)

    end

    def after_sign_out_path_for(_resource)

      "/"

    end



    def user_state
      @user = User.find_by(email: params[:user][:email])
      return if !@user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      redirect_to new_user_registration_path
      end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

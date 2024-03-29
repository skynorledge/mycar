class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource); end

  def after_sign_in_path_for(_resource); end

  def after_sign_out_path_for(_resource); end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :is_deleted, :profile_image, :email])
  end

  # def configure_permitted_parameters
  # devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  # end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthdate_year, :birthdate_month, :birthdate_day])
  end
  def post_params
    params.require(:post).permit(:userid, :file_name, :file_hash)
  end
end

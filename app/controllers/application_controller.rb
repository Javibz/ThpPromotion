class ApplicationController < ActionController::Base

  before_action :sanitize_devise_parameters, if: :devise_controller?
  #will call the function sanitze_paramaters when devise_controller is called

  def sanitize_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    #allowed first_name only for sign_up
  end

end

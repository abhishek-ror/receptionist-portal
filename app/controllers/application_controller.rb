class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  before_action :configure_permitted_parameters, if: :devise_controller?

	
	protected
	
	def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit({ role: [] }, :email, :password, :password_confirmation)
  	end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to patients_path,  flash: { error: "You are not authorized to perform this action." }
  end
end

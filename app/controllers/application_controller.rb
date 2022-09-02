class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters,  if: :devise_controller?

  private
    def configure_permitted_parameters 
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    end
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end

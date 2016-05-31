class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  #skip_before_action :protect_from_forgery
  protect_from_forgery with: :null_session


  #before_filter :cor
   def cor
     headers["Access-Control-Allow-Origin"]  = "*"
     headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
     headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
     head(:ok) if request.request_method == "OPTIONS"

   end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) << :nome :empresa_id
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nome, :email, :password, :password_confirmation, :empresa_id) }
  end


  # def verified_request?
  #   super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  # end

end

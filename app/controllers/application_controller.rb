class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit
  #after_action :verify_authorized, unless: :devise_controller?


  rescue_from Pundit::NotAuthorizedError do |e|
     flash[:danger] = "You cannot pass"
     redirect_to root_path
   end

   #devise invitable

   def configure_permitted_parameters
  devise_parameter_sanitizer.for(:invite) do |u|
    u.permit(:email, :rank, :board_control, :password, :password_confirmation,
             :invitation_token)
           end
         end
  end

class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
  
	before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]
  
	include AuthHelper
  
	helper_method :current_user, :currently_signed_in?

	def current_user
		return nil if session[:user_id].nil? 
		User.find(session[:user_id]) 
	end

	def currently_signed_in?(user)
		current_user == user
	end
  
  private

	  def authenticate
		 redirect_to login_path if current_user.nil?
	  end
end

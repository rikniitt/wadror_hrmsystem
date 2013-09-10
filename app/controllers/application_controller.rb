class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]
  
  include AuthHelper
  
  private

	  def authenticate
		 authenticate_or_request_with_http_basic do |username, password|
			is_hrm_authorized? username, password
		 end
	  end
end

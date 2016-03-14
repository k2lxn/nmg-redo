class ApplicationController < ActionController::Base
	before_filter :expire_hsts
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  	def expire_hsts
  		response.headers["Strict-Transport-Security"] = 'max-age=0'
  	end
end

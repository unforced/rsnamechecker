class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

	before_filter :set_time
	before_filter :set_user

	def set_time
		@time = Time.now
	end

	def set_user
		User.current_user = User.find_by_remember_token(cookies[:remember_token])
	end

end

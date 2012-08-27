class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

	before_filter :set_time
	before_filter :set_user

	def set_time
		@time = Time.now
	end

	def set_user
		User.current_user = cookies[:remember_token].present? ? User.find_by_remember_token(cookies[:remember_token]) : nil
	end

end

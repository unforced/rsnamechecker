class SessionsController < ApplicationController
	def new
		render 'new'
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			flash[:success] = 'You win the internetz'
			sign_in user
			redirect_to user
		else
			flash.now[:error] = "Sorry, you are incorrect.  Y u try hax?"
			render 'new'
		end
	end

	def destroy
		User.current_user = nil
		cookies.delete(:remember_token)	
		redirect_to root_path
	end
end

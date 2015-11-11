module SessionHelper

	def current_user
		if session[:user_id] #if the session exists
			User.find(session[:user_id]) #find the user_id
		else
			nil
		end
	end

	def user_logged_in?
		!current_user.nil?
	end
end
module SessionsHelper
	
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def logout
		session.delete(:user_id)
		@current_user = nil
	end

	def check_login
    redirect_to login_url, alert: "You need to log in to view this page." if current_user.nil?
  end
end
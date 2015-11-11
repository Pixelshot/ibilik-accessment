helpers SessionHelper

get '/login' do
	erb :'sessions/login'
end

post '/login' do
 @user = User.authenticate(params[:email], params[:password])
 # if user is in the database
	if @user
			session[:user_id] = @user.id
			#redirect to user's homepage
			redirect to '/'
	else
			@message = "Email or password is invalid"
			#redirect to login page
			erb :"sessions/login"
	end
end

delete '/logout' do
	session[:user_id] = nil
	redirect to '/'
end
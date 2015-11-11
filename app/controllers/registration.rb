get '/signup' do
	erb :"registration/signup"
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		#if the validations are met for the new user, then session will be created for the user by using user id and will be redirected to homepage
		session[:user_id] = @user.id 
		redirect to '/'
	else
		erb :"registration/signup"
	end
end
# render a new form
get '/properties/new' do
	erb :'properties/new'
end

# creating a property
post '/properties' do
	@user = current_user
	@property = @user.properties.new(params[:property])

	if @property.save
		redirect to "/properties/#{@property.id}"
	else
		erb :'properties/new'
	end
end

# show properties
get '/properties/:id' do
	@user = current_user
	@property = Property.find_by(id: params[:id])
	@comments = Comment.where(question_id: params[:id])
	erb :'properties/show'
end

# render edit form
get '/properties/:id/edit' do
	@user = current_user
	@property = Property.find_by(id: params[:id])
	erb :'properties/edit'
end

# update the property
put '/properties/:id' do
	@user = current_user
	@property = Property.find_by(id: params[:id])
	if @property.update(params[:property])
		redirect to "/properties/#{@property.id}"
	else
		erb :"properties/edit"
	end
end

# deleting
delete '/properties/:id' do
	@property = Property.find_by(id: params[:id])
	@property.destroy
	redirect to '/'
end
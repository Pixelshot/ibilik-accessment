#render a new comment 
get '/properties/:p_id/comments/new' do
	@property = Property.find_by(id: params[:p_id])
	@user = current_user
	erb :'comments/new'
end

#create comment to the property posted
post '/properties/:p_id/comments' do 
	@property = Property.find_by(id: params[:p_id])
	@user = current_user
	@comment = Comment.new(body: params[:body], property_id: params[:p_id], user_id: @user.id)
	if @comment.save
		redirect to "/comments/#{@comment.id}"
	else
		erb :'comments/new'
	end
end

# show the comment
get '/comments/:id' do 
	@comment = Comment.find_by(id: params[:id])
	@property = Property.find_by(id: @comment.property_id)
	erb :'comments/show'
end

# edit comment
get '/comments/:id/edit' do 
	@comment = Comment.find_by(id: params[:id])
	@property = Property.find_by(id: params[:id])
	@property = @comment.property
	erb :'comments/edit'
end

# update comment
put '/comments/:id' do
	@comment = Comment.find_by(id: params[:id])
	@property = Property.find_by(id: params[:id])
	if @comment.update(params[:comment])
		redirect to "/comments/#{@comment.id}"
	else
		erb :'comments/edit'
	end
end

#delete comment
delete '/comments/:id' do
	@comment = Comment.find_by(id: params[:id])
	@property = Property.find_by(id: params[:id])
	@comment.destroy
	redirect to '/'
end
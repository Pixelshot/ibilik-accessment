get '/users/:user_id/bookings' do
	@property = Property.where(id: current_user.bookings.pluck(:product_id))
	erb :"users/bookings"
end

get 'users/properties/booked' do
	@property = Property.where(id: Booking.where.not(user_id: current_user.id).pluck(:product_id), user_id: current_user.id)
	erb :"users/booked"
end



post '/bookings/:property_id/new' do
	make_booking = current_user.bookings.new(property_id: params[:property])
	make_booking.save
	redirect to '/'
end

delete '/bookings/:property_id' do
	@booking = Booking.find_by(id: params[:id])
	@booking.destroy
	redirect to '/'
end


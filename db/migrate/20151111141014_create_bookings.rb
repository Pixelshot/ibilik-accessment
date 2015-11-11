class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |x|
			x.string :user_id
			x.string :property_id
    		x.datetime :checkin
    		x.datetime :checkout
    		x.timestamps
  		end
  	end
end

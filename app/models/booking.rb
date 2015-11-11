class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :property
	validates :user_id, uniqueness: {scope: :property_id}
end

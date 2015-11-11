class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	validates :description, presence: true
	validates :price, presence: true
	validates :location, presence: true
end

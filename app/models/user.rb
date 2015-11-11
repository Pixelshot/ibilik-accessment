class User < ActiveRecord::Base
	# declare the relationship here eg. has_many :questions
	# validate your migration eg. validates :username, presence: true
	has_many :properties
	has_many :comments
	has_many :bookings

	validates :email, presence: true, uniqueness: true,
    	format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/ }
  	validates :username, presence: true
  	validates :password, presence: true

	# perform authentication on user
	def self.authenticate(email, password)
		user = User.find_by(email: email)
		if user && user.password == password
			return user
		else
			nil
		end
	end

	def user_logged_in?
		!current_user.nil?
	end
end
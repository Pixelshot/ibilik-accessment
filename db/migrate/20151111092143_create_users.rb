class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |x|
			x.string :fullname
			x.string :username
			x.string :email, unique: true
			x.string :password
			x.timestamps
		end
	end
end

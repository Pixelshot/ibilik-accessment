class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |x|
			x.text :body
			x.integer :property_id
			x.integer :user_id
			x.timestamps
		end
	end
end

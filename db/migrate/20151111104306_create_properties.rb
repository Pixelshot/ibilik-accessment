class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |x|
			x.string :location
			x.text :description
			x.decimal :price
			x.references :user
			x.timestamps
		end
	end
end

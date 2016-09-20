class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments

	def highest_rating_comment
  	comments.rating_desc.first
	end

	def worst_rating_comment
  	comments.rating_asc.first
	end

	def comments_count
		comments.count
	end	
end

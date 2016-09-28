class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
	validates :name, presence: true

	def highest_rating_comment
  	comments.rating_desc.first
	end

	def worst_rating_comment
  	comments.rating_asc.first
	end

	def comments_count
		comments.count
	end	

	def average_rating
  	comments.average(:rating).to_f
	end
end

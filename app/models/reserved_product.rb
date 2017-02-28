class ReservedProduct < ActiveRecord::Base
	belongs_to :product
	belongs_to :user



	def self.remove_reservation(cart, current_user)
		#destroy all reserved products
		cart.each do |id, quantity|
			rp = where("product_id = ? AND user_id=?", id, current_user.id ).order(id: :desc).limit(quantity).destroy_all
			#rp.quantity= rp.quantity - quantity
			#if rp.quantity >0
			# rp.save
			#else
			#	rp.destroy
			#end
		end
	end



end

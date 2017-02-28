class CartController < ApplicationController
before_action :authenticate_user!


  def index
  	if session[:cart] then
  		@cart = session[:cart]
  	else
  		@cart = {}
  	end

  end

  def add
		id = params[:id]

		@product= Product.find(id)
		#@rp = ReservedProduct.where("product_id= ?", id)
    available_quantity= @product.quantity

    #if r_p.exists? && r_p.expire_time > Time.now 
    
    if ReservedProduct.exists?(:product_id => id)
    	
      q = ReservedProduct.where("product_id = ? AND expire_time > ?", id, Time.now).count
    	available_quantity= available_quantity - q
    	
    end

		Product.find(id).score
		if available_quantity >0

			#reserve product
			@rp= ReservedProduct.new
			@rp.product= Product.find(id)
			@rp.user= current_user
			@rp.expire_time= Time.now + 30*60
			@rp.save

			#add to cart

			if session[:cart] then
				cart = session[:cart]
			else
				session[:cart] = {}
				cart = session[:cart] 
			end
			if cart[id] then
				cart[id] = cart[id]+1
			else
				cart[id]=1
			end
			redirect_to :action => :index
		else
			#message that this product is not currently available
			redirect_to cart_path, notice: 'Sorry, the quantity of these plants is limited. You cannot buy more .'
		end
		
	end


	def clearCart
		ReservedProduct.remove_reservation(session[:cart], current_user)
		session[:cart] = nil
		redirect_to :action => :index
	end



end

class PaymentsController < ApplicationController
  def create
  	
  	token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card
	  @product = Product.find(params[:product_id])
	  @user = current_user
	  begin
	    charge = Stripe::Charge.create(
	      :amount => (@product.price*100).to_i, # amount in cents, again
	      :currency => "GBP",
	      :source => token,
	      :description => params[:stripeEmail]
	    )
	    if charge.paid

	    	@order = Order.new 
	    	@order.user = @user
	    	#@order.product = @product
	    	@order.total = @product.price
	    	logger.debug "Order fields before saving: #{@order.user.id}, #{@order.total}"
	    	@order.save

	    	@line_item = LineItem.new
	    	@line_item.product = @product
	    	@line_item.order = @order
	    	@line_item.quantity = 1
	    	@line_item.save

  		end
	    redirect_to orders_path, notice: 'Thank you for your purchase'
	  	rescue Stripe::CardError => e
	    # The card has been declined
	    redirect_to :back, alert: 'The card has been declined'
	  end

  end

  def create2
  	token = params[:stripeToken]
  	total = params[:total].to_f
  	
  	@user = current_user

  	begin
  		charge = Stripe::Charge.create(
	      :amount => (total*100).to_i, # amount in cents, again
	      :currency => "GBP",
	      :source => token,
	      :description => params[:stripeEmail]
	    )

	    if charge.paid

	    	#create order
	    	@order = Order.new 
	    	@order.user = current_user
	    	@order.total = total
				@order.save
 				
 				#create line_items from cart
 			  @cart = session[:cart]
 			  @cart.each do |id, quantity| 

					@p= Product.find(id)
					@p.quantity=  @p.quantity - quantity
					@p.save

					@line_item =LineItem.new
					@line_item.product = @p
					@line_item.order = @order
					@line_item.quantity = quantity
					@line_item.save

				end
				
				#to remove reserved items
				ReservedProduct.remove_reservation(@cart, current_user)
				#to clean the shopping cart
				session[:cart] = nil
			
	    end

	    redirect_to orders_path, notice: 'Thank you for your purchase'
	  	rescue Stripe::CardError => e
	    # The card has been declined
	    redirect_to :back, notice: 'The card has been declined'
  	end
  end

end

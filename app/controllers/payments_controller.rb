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
	    	@order.product = @product
	    	@order.total = @product.price
	    	@order.save
  		end
	    redirect_to product_path(@product), notice: 'Thank you for your purchase'
	  rescue Stripe::CardError => e
	    # The card has been declined
	    redirect_to :back, alert: 'The card has been declined'
	  end
  end
end

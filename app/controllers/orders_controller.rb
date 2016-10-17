class OrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource 
  
  def index
  	if signed_in? && current_user.admin? 
  		@orders = Order.all 
  	 else
    	@orders = current_user.orders.all
    end
  end

  def show
    @line_items = @order.line_items 
  end
  

  private

  def order_params
    params.require(:order).permit(:user_id, :billing_address, :delivery_address, :total)
  end
  

end

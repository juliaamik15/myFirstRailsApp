class OrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource 
  
  def index
  	if signed_in? && current_user.admin? 
  		@orders = Orders.all 
  	 else
    	@orders = current_user.orders.all
    end
  end

  

  private

  def order_params
    params.require(:order).permit(:user_id, :product_id, :total)
  end
  

end

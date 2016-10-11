class OrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource 
  
  def index
    @orders = Order.all
  end

  

  private

  def order_params
    params.require(:order).permit(:user_id, :product_id, :total)
  end
  

end

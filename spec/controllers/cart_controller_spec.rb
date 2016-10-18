require 'rails_helper'

RSpec.describe CartController, type: :controller do

  describe "cart#index" do
    it "returns cart" do
    	expect(:get => '/cart').to route_to(:controller => "cart", :action => "index")
     
    end
  end

end

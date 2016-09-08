class StaticPagesController < ApplicationController
  def gallery
  end

  def landing_page
  	@product = Product.limit(3)
  end
  
end

class StaticPagesController < ApplicationController
  def gallery
  end

  def landing_page
  	@featured_product = Product.first
  end
end

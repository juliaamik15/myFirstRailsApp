require 'rails_helper'

describe Order do

	it "can not exist without user" do
		@product = Product.create!(name: "Rebutia perplexa")
		expect(@product.orders.new(product: @product, total: 3)).to_not be_valid
	end
end
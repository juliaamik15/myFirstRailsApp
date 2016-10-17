require 'rails_helper'

describe Order do

	it "require a user" do
		#@product = Product.create!(name: "Rebutia perplexa")
		expect(FactoryGirl.build(:order_require_user)).to_not be_valid
		#expect(@product.orders.new(product: @product, total: 3)).to_not be_valid
	end
end
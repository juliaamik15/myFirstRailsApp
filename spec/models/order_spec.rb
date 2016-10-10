require 'rails_helper'

describe Order do

	it "require a user" do
		#@product = Product.create!(name: "Rebutia perplexa")
		@product = FactoryGirl.create(:product)
		expect(FactoryGirl.build(:order_require_user, product: @product)).to_not be_valid
		#expect(@product.orders.new(product: @product, total: 3)).to_not be_valid
	end
end
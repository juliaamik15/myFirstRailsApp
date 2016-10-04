require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before (:example) do
  		@product = Product.create!(name: "Rebutia perplexa")
  		@user = User.create!(email: "testuser@gmail.com", password: "123456")
  		@product.comments.create!(rating: 1, user: @user, body: "Awful")
  		@product.comments.create!(rating: 3, user: @user, body: "not bad")
  		@product.comments.create!(rating: 5, user: @user, body: "great")
		end
  	
  	it "returns the average rating of all comments" do
  		expect(@product.average_rating).to eq (3)
  	end

		
	end

	it "is not valid" do
		expect(Product.new(description: "Nice cactus")).to_not be_valid
	end

end
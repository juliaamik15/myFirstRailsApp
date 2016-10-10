require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before (:example) do
  		#@product = Product.create!(name: "Rebutia perplexa")
      @product = FactoryGirl.create (:product)
  		#@user = User.create!(email: "testuser@gmail.com", password: "123456")
      @user = FactoryGirl.create(:user)
  		#@product.comments.create!(rating: 1, user: @user, body: "Awful")
      FactoryGirl.create(:comment, user: @user, product: @product, rating: 3, body: "not bad")
      FactoryGirl.create(:comment, user: @user, product: @product)
      FactoryGirl.create(:comment, user: @user, product: @product,rating: 5, body: "great")
  		#@product.comments.create!(rating: 3, user: @user, body: "not bad")
  		#@product.comments.create!(rating: 5, user: @user, body: "great")
		end
  	
  	it "returns the average rating of all comments" do
  		expect(@product.average_rating).to eq (3)
  	end

		
	end

	it "is not valid" do
    @product = FactoryGirl.build(:nameless)
		#expect(Product.new(description: "Nice cactus")).to_not be_valid
    expect(@product).to_not be_valid
	end

end
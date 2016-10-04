require 'rails_helper'

describe Comment do

	context "when the comment is created" do
		before (:example) do
			@product = Product.create!(name: "Rebutia perplexa")
  		@user = User.create!(email: "testuser@gmail.com", password: "123456")
		end

		it "is not valid with string rating" do
			expect(@product.comments.new(rating: "Awful", user: @user, body: "Awful")).to_not be_valid
		end

	end

end

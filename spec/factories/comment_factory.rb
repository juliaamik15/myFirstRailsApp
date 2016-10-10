FactoryGirl.define do

	factory :comment do
		body "Awful"
		rating 1
		user 
		product
	end

	factory :string_rating, class: Comment do
		rating "Auful"
		user
		product
	end
end


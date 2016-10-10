FactoryGirl.define do
	factory :product do
		name "Rebutia perplexa"
	end

	factory :nameless, class: Product do
		description "Nice cactus"
	end 
end

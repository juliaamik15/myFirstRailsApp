FactoryGirl.define do 
	factory :order_require_user, class: Order do
		total 3
		product
		user nil
	end
	
end
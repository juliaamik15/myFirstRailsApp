FactoryGirl.define do 
	factory :order_require_user, class: Order do
		total 3
		user nil
	end
	
end
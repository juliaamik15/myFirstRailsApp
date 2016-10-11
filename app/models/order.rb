class Order < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates :user, presence: true
  validates :product, presence: true
  
end

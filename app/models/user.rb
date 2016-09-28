class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders
	has_many :comments, dependent: :destroy

	after_create :send_sign_up_mail
  def send_sign_up_mail
    UserMail.send_new_user_message( self, "Thank you for signing up with Cacti from Julia!" ).deliver_now
  end
	
end

class UserMail < ApplicationMailer
	default from: "juliaamik15@gmail.com"

	def contact_form(email, name, message)
		@message=message
		mail(:from => email ,
			:to => 'juliaamik15@gmail.com',
			:subject => "A new contact form  message from #{name}")
	end

	def send_new_user_message(user, message)
		@message=message
		mail(:from => 'juliaamik15@gmail.com' ,
			:to => user.email ,
			:subject => "The user is created.")
	end
end

class UserMailPreview < ActionMailer::Preview
	def contact_form
    UserMail.contact_form("juliaamik15@gmail.com", "John", "Hello World!")
  end
end
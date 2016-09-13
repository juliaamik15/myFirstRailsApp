class StaticPagesController < ApplicationController
  def gallery
  end

  def landing_page
  	@product = Product.limit(3)
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	#ActionMailer::Base.mail(:from => @email,
     #:to => 'juliaamik15@gmail.com',
     #:subject => "A new contact form message from #{@name}",
     #:body => @message).deliver_now

  	UserMail.contact_form(@email, @name, @message).deliver_now

	end
  
end

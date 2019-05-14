class UserMailer < ApplicationMailer
  # default from: "d.sander@schaltglas.de"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'sander.bewerbung@gmx.de',
         subject: "A new contact form message from #{name}",
         body: message)
  end

  def order_received_email(email, name, order)
		@name = name
		@order = order
		mail(from: "sander.bewerbung@gmx.de",
    			to: email,
    			subject: "Thank you for your purchase!",
          body: 'something')
	end

  def welcome_send(user)
    @user = user
    mail to: @user.email, subject: "Welcome to our Site", body:'Some Text', from: "info@mysite.com"
  end
end

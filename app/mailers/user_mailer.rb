class UserMailer < ApplicationMailer
  # default from: "d.sander@schaltglas.de"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'sander.bewerbung@gmx.de',
         subject: "A new contact form message from #{name}")
  end

  def welcome_send(user)
    @user = user
    mail to: user.email, subject: "Welcome to our Site", from: "info@mysite.com"
  end
end

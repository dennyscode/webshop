class UserMailer < ApplicationMailer
  default from: "test@example.com"

def contact_form(email, name, message)
@message = message
  mail(from: email,
       to: 'sander.bewerung@gmx.de',
       subject: "A new contact form message from #{name}")
end
end

class UserMailer < ApplicationMailer
  # default from: "d.sander@schaltglas.de"

def contact_form(email, name, message)
@message = message
  mail(from: email,
       to: 'sander.bewerbung@gmx.de',
       subject: "A new contact form message from #{name}")
end
end

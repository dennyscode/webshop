# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("denny@example.com", "Denny", "Hello World!")
  end

  def welcome_send
    @user = User.find(1)
    UserMailer.welcome_send(@user)
  end

	def order_received_email
		UserMailer.order_received_email("denny@example.com", "Denny", Order.first)
	end



end

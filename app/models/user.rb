class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # after_create :welcome_send
   # # Send Welcome Message when Registered
   #
   # def welcome_send
   #   UserMailer.welcome_send(self).deliver
   #   redirect_to root_path, alert: "Thank you for the registration"
   # end
end

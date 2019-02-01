class Order < ApplicationRecord
  belongs_to :product
  after_create :order_received_email


  def order_received_email
  end
end

class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    @email = params[:stripeEmail]
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @product.prize.to_int*100, # amount in cents, again
        currency: "eur",
        source: token,
        :description => params[:stripeEmail],
        :receipt_email => params[:stripeEmail]
      )

    if charge.paid
      @order = Order.create(product_id: @product.id, user_id: @user.id, total: @product.prize)
      flash[:success] = "Your payment was processed successfully"
    end
      UserMailer.order_received_email(@email, current_user.first_name, @order).deliver_now

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end
end

class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:product).all
  end

  def show
    begin
      @order = Order.find(params[:id])
    # rescue ActiveRecord::RecordNotFound => e
    #   @order = nil
    end
  end

  def new
  end

  def create
  end

  def destroy
  end
end

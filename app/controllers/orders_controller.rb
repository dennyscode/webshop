class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.includes(:product).all
  end

  def show
    @sum_orders  = Order.all.length
    @order = Order.find(params[:id])
    # rescue ActiveRecord::RecordNotFound => e
    #   @order = nil
  end

  def new
  end

  def create
  end

  def destroy
  end
end

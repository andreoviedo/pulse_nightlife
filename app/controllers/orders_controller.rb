class OrdersController < ApplicationController
  before_action :authenticate_consumer!
  before_action :check_authorization, only: [:show]

  def index
    @consumer = Consumer.find(params[:consumer_id])
    @orders = @consumer.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @order = current_consumer.orders.build(order_params)
    @order.event = @event
    @order.total_price = @event.price * @order.quantity

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      redirect_to @event, alert: @order.errors.full_messages.to_sentence
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity)
  end

  def check_authorization
    @order = Order.find(params[:id])
    unless current_consumer == @order.consumer
      redirect_to root_path, alert: "You are not authorized to view this order."
    end
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_consumer!
  before_action :set_event, only: [:create]
  
  def index
    @orders = current_consumer.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    unless @order.consumer == current_consumer
      redirect_to root_path, alert: "You are not authorized to view this order."
    end
  end

  def create
    @order = current_consumer.orders.build(order_params)
    @order.event = @event
    @order.total_price = @event.price * @order.quantity
    @order.status = "pending"

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      redirect_to @event, alert: @order.errors.full_messages.to_sentence
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def order_params
    params.require(:order).permit(:quantity)
  end
end

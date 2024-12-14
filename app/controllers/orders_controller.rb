class OrdersController < ApplicationController
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
end

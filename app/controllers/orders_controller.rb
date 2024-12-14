class OrdersController < ApplicationController
  def index
    matching_orders = Order.all

    @list_of_orders = matching_orders.order({ :created_at => :desc })

    render({ :template => "orders/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_orders = Order.where({ :id => the_id })

    @the_order = matching_orders.at(0)

    render({ :template => "orders/show" })
  end

  def create
    the_order = Order.new
    the_order.table_service_id = params.fetch("query_table_service_id")
    the_order.consumer_id = params.fetch("query_consumer_id")
    the_order.event_id = params.fetch("query_event_id")

    if the_order.valid?
      the_order.save
      redirect_to("/orders", { :notice => "Order created successfully." })
    else
      redirect_to("/orders", { :alert => the_order.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_order = Order.where({ :id => the_id }).at(0)

    the_order.table_service_id = params.fetch("query_table_service_id")
    the_order.consumer_id = params.fetch("query_consumer_id")
    the_order.event_id = params.fetch("query_event_id")

    if the_order.valid?
      the_order.save
      redirect_to("/orders/#{the_order.id}", { :notice => "Order updated successfully."} )
    else
      redirect_to("/orders/#{the_order.id}", { :alert => the_order.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_order = Order.where({ :id => the_id }).at(0)

    the_order.destroy

    redirect_to("/orders", { :notice => "Order deleted successfully."} )
  end
end

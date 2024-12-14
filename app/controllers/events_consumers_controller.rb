class EventsConsumersController < ApplicationController
  def index
    matching_events_consumers = EventsConsumer.all

    @list_of_events_consumers = matching_events_consumers.order({ :created_at => :desc })

    render({ :template => "events_consumers/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_events_consumers = EventsConsumer.where({ :id => the_id })

    @the_events_consumer = matching_events_consumers.at(0)

    render({ :template => "events_consumers/show" })
  end

  def create
    the_events_consumer = EventsConsumer.new
    the_events_consumer.consumers_id = params.fetch("query_consumers_id")
    the_events_consumer.event_id = params.fetch("query_event_id")

    if the_events_consumer.valid?
      the_events_consumer.save
      redirect_to("/events_consumers", { :notice => "Events consumer created successfully." })
    else
      redirect_to("/events_consumers", { :alert => the_events_consumer.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_events_consumer = EventsConsumer.where({ :id => the_id }).at(0)

    the_events_consumer.consumers_id = params.fetch("query_consumers_id")
    the_events_consumer.event_id = params.fetch("query_event_id")

    if the_events_consumer.valid?
      the_events_consumer.save
      redirect_to("/events_consumers/#{the_events_consumer.id}", { :notice => "Events consumer updated successfully."} )
    else
      redirect_to("/events_consumers/#{the_events_consumer.id}", { :alert => the_events_consumer.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_events_consumer = EventsConsumer.where({ :id => the_id }).at(0)

    the_events_consumer.destroy

    redirect_to("/events_consumers", { :notice => "Events consumer deleted successfully."} )
  end
end

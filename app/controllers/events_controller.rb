class EventsController < ApplicationController
  def index
    matching_events = Event.where("date >= ?", Date.today)
    @list_of_events = matching_events.order({ :date => :asc })
    render({ :template => "events/index" })
  end

  def show
    the_id = params.fetch("id")
    matching_events = Event.where({ :id => the_id })
    @the_event = matching_events.at(0)
    render({ :template => "events/show" })
  end

  def create
    the_event = Event.new
    the_event.name = params.fetch("query_name")
    the_event.venue_id = params.fetch("query_venue_id")
    the_event.description = params.fetch("query_description")
    the_event.date = params.fetch("query_date")
    the_event.price = params.fetch("query_price")
    the_event.capacity = params.fetch("query_capacity")

    if the_event.valid?
      the_event.save
      redirect_to("/events", { :notice => "Event created successfully." })
    else
      redirect_to("/events", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.name = params.fetch("query_name")
    the_event.venue_id = params.fetch("query_venue_id")
    the_event.description = params.fetch("query_description")
    the_event.date = params.fetch("query_date")
    the_event.price = params.fetch("query_price")
    the_event.capacity = params.fetch("query_capacity")

    if the_event.valid?
      the_event.save
      redirect_to("/events/#{the_event.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{the_event.id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("id")
    the_event = Event.where({ :id => the_id }).at(0)
    the_event.destroy
    redirect_to("/events", { :notice => "Event deleted successfully."} )
  end
end

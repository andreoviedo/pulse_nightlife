class EventsController < ApplicationController
  before_action :require_auth, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_authorization, only: [:edit, :update, :destroy]

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

  def new
    @the_event = Event.new
    render({ :template => "events/new" })
  end

  def create
    unless promoter_signed_in? || venue_signed_in?
      redirect_to(events_path, { alert: "You must be a promoter or venue to create events." }) and return
    end

    the_event = Event.new
    the_event.name = params.fetch("query_name")
    the_event.venue_id = params.fetch("query_venue_id")
    the_event.description = params.fetch("query_description")
    the_event.date = params.fetch("query_date")
    the_event.price = params.fetch("query_price")
    the_event.capacity = params.fetch("query_capacity")

    if venue_signed_in?
      the_event.venue_id = current_venue.id
    end

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

  private

  def require_auth
    unless promoter_signed_in? || venue_signed_in?
      redirect_to(events_path, alert: "You must be logged in as a promoter or venue to perform this action.")
    end
  end

  def check_authorization
    the_event = Event.find(params[:id])
    
    if venue_signed_in?
      unless the_event.venue_id == current_venue.id
        redirect_to(events_path, alert: "You are not authorized to modify this event.")
      end
    elsif promoter_signed_in?
      unless the_event.promoters.include?(current_promoter)
        redirect_to(events_path, alert: "You are not authorized to modify this event.")
      end
    end
  end
end

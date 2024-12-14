class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy, :rsvp]
  before_action :authenticate_consumer!, only: [:rsvp]

  def index
    matching_events = Event.where("date >= ?", Date.today)
    @list_of_events = matching_events.order({ :date => :asc })
  end

  def show
    @rsvp = current_consumer&.events_consumers&.find_by(event: @the_event)
    @order = Order.new
  end

  def new
    @the_event = Event.new
  end

  def create
    the_event = Event.new(event_params)

    if the_event.valid?
      the_event.save
      redirect_to("/events", { :notice => "Event created successfully." })
    else
      redirect_to("/events", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def update
    if @the_event.update(event_params)
      redirect_to("/events/#{@the_event.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{@the_event.id}", { :alert => @the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @the_event.destroy
    redirect_to("/events", { :notice => "Event deleted successfully."} )
  end

  def rsvp
    status = params[:status]
    
    if !["interested", "going"].include?(status)
      return redirect_to @the_event, alert: "Invalid RSVP status."
    end

    @rsvp = current_consumer.events_consumers.find_or_initialize_by(event: @the_event)
    @rsvp.status = status

    if @rsvp.save
      redirect_to @the_event, notice: "Successfully RSVPed to the event!"
    else
      redirect_to @the_event, alert: @rsvp.errors.full_messages.to_sentence
    end
  end

  private

  def set_event
    @the_event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :venue_id, :description, :date, :price, :capacity)
  end
end

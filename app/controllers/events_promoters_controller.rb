class EventsPromotersController < ApplicationController
  def index
    matching_events_promoters = EventsPromoter.all

    @list_of_events_promoters = matching_events_promoters.order({ :created_at => :desc })

    render({ :template => "events_promoters/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_events_promoters = EventsPromoter.where({ :id => the_id })

    @the_events_promoter = matching_events_promoters.at(0)

    render({ :template => "events_promoters/show" })
  end

  def create
    the_events_promoter = EventsPromoter.new
    the_events_promoter.event_id = params.fetch("query_event_id")
    the_events_promoter.promoter_id = params.fetch("query_promoter_id")

    if the_events_promoter.valid?
      the_events_promoter.save
      redirect_to("/events_promoters", { :notice => "Events promoter created successfully." })
    else
      redirect_to("/events_promoters", { :alert => the_events_promoter.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_events_promoter = EventsPromoter.where({ :id => the_id }).at(0)

    the_events_promoter.event_id = params.fetch("query_event_id")
    the_events_promoter.promoter_id = params.fetch("query_promoter_id")

    if the_events_promoter.valid?
      the_events_promoter.save
      redirect_to("/events_promoters/#{the_events_promoter.id}", { :notice => "Events promoter updated successfully."} )
    else
      redirect_to("/events_promoters/#{the_events_promoter.id}", { :alert => the_events_promoter.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_events_promoter = EventsPromoter.where({ :id => the_id }).at(0)

    the_events_promoter.destroy

    redirect_to("/events_promoters", { :notice => "Events promoter deleted successfully."} )
  end
end

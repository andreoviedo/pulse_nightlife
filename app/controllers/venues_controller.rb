class VenuesController < ApplicationController
  def index
    @venues = Venue.all.order(name: :asc)
    render({ :template => "venues/index" })
  end

  def show
    @venue = Venue.find(params.fetch("id"))
    @upcoming_events = @venue.events.where("date >= ?", Date.today).order(date: :asc)
    render({ :template => "venues/show" })
  end
end 

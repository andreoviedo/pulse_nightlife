class PagesController < ApplicationController
  def home
    @upcoming_events = Event.where("date >= ?", Date.today).order(date: :asc).limit(6)
    @featured_venues = Venue.limit(3)
  end
end 

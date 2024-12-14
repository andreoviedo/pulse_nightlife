class VenuesController < ApplicationController
  before_action :authenticate_venue!, only: [:edit, :update]
  before_action :check_authorization, only: [:edit, :update]

  def index
    @venues = Venue.all.order(name: :asc)
    render({ :template => "venues/index" })
  end

  def show
    @venue = Venue.find(params.fetch("id"))
    @upcoming_events = @venue.events.where("date >= ?", Date.today).order(date: :asc)
    render({ :template => "venues/show" })
  end

  def edit
    @venue = Venue.find(params[:id])
    render({ :template => "venues/edit" })
  end

  def update
    @venue = Venue.find(params[:id])
    
    if @venue.update(venue_params)
      redirect_to venue_path(@venue), notice: 'Venue was successfully updated.'
    else
      render :edit
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :capacity)
  end

  def authenticate_venue!
    unless venue_signed_in?
      redirect_to venues_path, alert: "You must be logged in as a venue to perform this action."
    end
  end

  def check_authorization
    @venue = Venue.find(params[:id])
    unless current_venue == @venue
      redirect_to venues_path, alert: "You are not authorized to modify this venue."
    end
  end
end 

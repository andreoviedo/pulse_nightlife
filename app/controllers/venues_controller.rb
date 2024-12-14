class VenuesController < ApplicationController
  before_action :authenticate_venue!, only: [:new, :create, :edit, :update]
  before_action :set_venue, only: [:show, :edit, :update]
  before_action :check_venue_owner, only: [:edit, :update]

  def index
    @venues = Venue.all.order(name: :asc)
  end

  def show
    @upcoming_events = @venue.events.where("date >= ?", Date.today).order(date: :asc)
  end

  def new
    @venue = current_venue.build
  end

  def create
    @venue = current_venue.build(venue_params)

    if @venue.save
      redirect_to venue_path(@venue), notice: 'Venue was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to venue_path(@venue), notice: 'Venue was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :capacity, :display_picture)
  end

  def check_venue_owner
    unless @venue == current_venue
      redirect_to venues_path, alert: "You are not authorized to modify this venue."
    end
  end
end 

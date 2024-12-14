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
end 

class PromotersController < ApplicationController
  def show
    @promoter = Promoter.find(params[:id])
    @events = @promoter.events.order(date: :asc)
  end
end 

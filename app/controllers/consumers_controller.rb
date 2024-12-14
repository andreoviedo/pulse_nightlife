class ConsumersController < ApplicationController
  before_action :authenticate_consumer!, only: [:show]
  before_action :check_authorization, only: [:show]

  def show
    @consumer = Consumer.find(params[:id])
    @orders = @consumer.orders.order(created_at: :desc)
    @events = @consumer.events.where("date >= ?", Date.today).order(date: :asc)
  end

  private

  def check_authorization
    unless current_consumer == Consumer.find(params[:id])
      redirect_to root_path, alert: "You are not authorized to view this profile."
    end
  end
end 

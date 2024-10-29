class EventsController < ApplicationController

  def index
    @events = Event.includes(:users).order(:created_at).page(params[:page]).per(9)
  end

  def show
    @event = Event.find(params[:id])
  end

end

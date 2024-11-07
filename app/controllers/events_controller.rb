class EventsController < ApplicationController

  def index
    @current_events = Event.current_events.order(:created_at).page(params[:page]).per(9)
    @sold_events = Event.sold_out.order(:created_at).page(params[:page]).per(9)

    @ended_events = Event.ended_events.order(:created_at).page(params[:page]).per(9)
    @upcoming_event = Event.ended_events
  end

  def show
    @event = Event.find(params[:id])
  end

end

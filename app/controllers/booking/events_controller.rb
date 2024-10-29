class Booking::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy ]
  before_action :authorized_organizer, only: [:new, :create, :update, :destroy]

  def index
    @events = current_user.events.includes(:users).order(:created_at).page(params[:page]).per(9)
  end

  
  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(set_params)
    if @event.save
      @event.create_booking(current_user.id, @event.id)
      redirect_to booking_events_path, notice: "Event Create Successfully"
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def show 
  end

  def edit
  end

  def update
    if current_user.organizer?
      if @event.update(set_params)
        redirect_to booking_events_path, notice: "Event Update Succesfully"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path,  notice: "Event deleted Successfully"
    end
  end

  private 

  def set_params
    params.require(:event).permit(:title, :description, :location, :date, :time, :ticket_price, :available_ticket)
  end

  def set_event
    @event = Event.find(params[:id])
    @user = current_user
  end

end

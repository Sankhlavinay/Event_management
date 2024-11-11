class Event < ApplicationRecord
  paginates_per 10

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  has_many_attached :images


  TICKET_PRICE = [499,799,999]

  validates :title, :description, :location, :date, :time, presence: true
  validates :ticket_price, :available_ticket, presence: true, numericality: true 
  
  scope :sold_out, -> { includes(:users).where(available_ticket: 0) }  
  scope :current_events, -> { includes(:users).where("date > ?", Date.today ) }  
  scope :ended_events, -> { includes(:users).where("date < ?", Date.today ) }  

  def create_booking(user_id, event_id)
    Booking.create!(user_id: user_id, event_id: event_id)
  end

  def is_upcoming_event?
    date > Date.today 
  end

end

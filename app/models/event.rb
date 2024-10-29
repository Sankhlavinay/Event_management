class Event < ApplicationRecord
  paginates_per 10

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings


  TICKET_PRICE = [499,799,999]

  validates :title, :description, :location, :date, :time, presence: true
  validates :ticket_price, :available_ticket, presence: true, numericality: true 
    

  def create_booking(user_id, event_id)
    Booking.create!(user_id: user_id, event_id: event_id)
  end

end

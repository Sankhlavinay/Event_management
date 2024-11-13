class Event < ApplicationRecord
  before_create :set_is_deleted
  paginates_per 10

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  has_many_attached :images


  TICKET_PRICE = [499,799,999]

  validates :title, :description, :location, :date, :time, presence: true
  validates :ticket_price, :available_ticket, presence: true, numericality: true 
  
  scope :sold_out, -> { includes(:users).where(available_ticket: 0) }  
  scope :current_events, -> { includes(:users).where("date > ?", Date.today ).where(is_deleted: false) }  
  scope :ended_events, -> { includes(:users).where("date < ?", Date.today ) } 

  scope :soft_deleted, -> { where(is_deleted: true) } 

  def create_booking(user_id, event_id)
    Booking.create!(user_id: user_id, event_id: event_id)
  end

  def is_upcoming_event?
    date > Date.today 
  end

  def set_is_deleted
    self.is_deleted = false if is_deleted.nil?
  end

  def set_true_is_deleted
    is_deleted  == false
  end

  def set_false_is_deleted
    is_deleted  == true
  end

end

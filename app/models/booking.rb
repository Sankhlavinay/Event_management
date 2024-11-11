class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :update_available_tickets

  def update_available_tickets
    return if event.available_ticket.nil? || no_of_tickets.nil?
    event.update(available_ticket: event.available_ticket - no_of_tickets)
  end

end

class BookingsMailer < ApplicationMailer
  def booking_confirmation(booking)
    @booking = booking
    @user = booking.user
    @event = booking.event

    mail to: @user.email, subject: "Booking Confirmation for #{@event.title}"
  end
end

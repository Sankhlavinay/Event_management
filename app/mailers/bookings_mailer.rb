require "rqrcode"

class BookingsMailer < ApplicationMailer
  include BookingsHelper
  def booking_confirmation(booking)

    @booking = booking
    @user = booking.user
    @event = booking.event
    @svg = qr_code_svg_for(@booking)

    mail to: @user.email, subject: "Booking Confirmation for #{@event.title}"
  end

  def booking_root_url(booking_id)
    if Rails.env.development?
      "http://localhost:3000/bookings/#{booking_id}/booking_details"
    else
      #later TODO
    end
  end
end

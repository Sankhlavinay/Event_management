require "rqrcode"

class BookingsMailer < ApplicationMailer
  def booking_confirmation(booking)

    qrcode = RQRCode::QRCode.new(booking_root_url(booking.id))
    @svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5,
      standalone: true,
      use_path: true
    )
    @booking = booking
    @user = booking.user
    @event = booking.event

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

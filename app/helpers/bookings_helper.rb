module BookingsHelper
  def qr_code_svg_for(booking)
    qrcode = RQRCode::QRCode.new(booking_root_url(booking))
    qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 4,
      standalone: true,
      use_path: true
    )
  end

  private

  def booking_root_url(booking_id)
    if Rails.env.development?
      "http://localhost:3000/bookings/#{booking_id}/booking_details"
    else
      #later TODO
    end
  end
end

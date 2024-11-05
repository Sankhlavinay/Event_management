class BookingsController < ApplicationController
  def create
    @stripe_service = StripeService.new
    @event = Event.find(params[:event_id])
    @user = User.find_by(email: params[:email])
    unless @user.present?
      @user = User.create(customer_params)
    end

    @stripe_user = @stripe_service.find_or_create_user(@user)

    @card = @stripe_service.create_stripe_customer_card(card_params, @stripe_user)

    @amount = (params[:no_of_tickets].to_i * @event.ticket_price).to_i

    @charge = @stripe_service.create_stripe_charge(@amount, @stripe_user.id, @card.id, @event)

    @booking = @event.bookings.create(
      user_id: @user.id, 
      stripe_transaction_id: @charge.id, 
      no_of_tickets: params[:no_of_tickets].to_i,
      price_paid: @amount
    )
    BookingsMailer.booking_confirmation(@booking).deliver_now
    redirect_to event_path(@event), notice: "Your Tickets has been booked"

  rescue Stripe::StripeError => error
    redirect_to event_path(@event), alert: "#{error.message}"
  end

  def all_bookings
    @bookings = current_user.bookings.includes(:event)
  end

  def booking_details
    @booking = Booking.find(params[:id])
  end

  private

  def customer_params
    params.permit(:full_name, :email, :contact_number).merge(role: "Attendee")
  end

  def card_params
    params.permit(:card_number, :cvv, :exp_month, :exp_year)
  end
end

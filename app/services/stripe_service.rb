require 'stripe'

class StripeService
  def initialize()
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
  end

  def find_or_create_user(user)
    if user.stripe_user_id.present?
      stripe_user = Stripe::Customer.retrieve(user.stripe_user_id)
    else
      stripe_user = Stripe::Customer.create({
        email: user.email,
      })
      user.update(stripe_user_id: stripe_user.id)
    end
    stripe_user
  end

  # def create_card_token(params)
  #   Stripe::Token.create({
  #     card: {
  #       number: params[:card_number].to_s,
  #       exp_month: params[:exp_month],
  #       exp_year: params[:exp_year],
  #       cvv: params[:cvv]
  #     }
  #   })
  # end

  def create_stripe_customer_card(params, stripe_user)
    token = "tok_visa" 
    Stripe::Customer.create_source(
      stripe_user.id,
      { source: token }
    )
  end

  def create_stripe_charge(amount, stripe_user_id, card_id, event)
    Stripe::Charge.create({
      amount: (amount * 100),
      currency: 'usd',
      source: card_id,
      customer: stripe_user_id,
      description: "Amount $#{amount} charged for #{event.title}"
    })
  end
end
class Subscription < ActiveRecord::Base
  belongs_to :plan
  validates_presence_of :plan_id
  validates_presence_of :email
  validates_presence_of :post_num
  attr_accessor :stripe_card_token, :paypal_payment_token, :post_num
  attr_accessible :plan_id, :paypal_customer_token, :paypal_payment_token, :email, :post_num
  
  def save_with_payment
    if valid?
      if paypal_payment_token.present?
        save_with_paypal_payment
      else
        save_with_stripe_payment
      end
    end
  end
  
  def paypal
    PaypalPayment.new(self)
  end
  
  def save_with_paypal_payment
  
  response = paypal.make_recurring

   self.paypal_recurring_profile_token = response.profile_id
  
  save!
end

  def save_with_stripe_payment
    customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
    self.stripe_customer_token = customer.id
    save!
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  def payment_provided?
    stripe_card_token.present? || paypal_payment_token.present?
  end
  def make_recurring
    ppr = PayPal::Recurring.new(
    token: @subscription.paypal_payment_token,
    payer_id: @subscription.paypal_customer_token,
    description: @subscription.plan.name,
    
    amount: @subscription.plan.price,
    currency: "USD"
  )
  response = ppr.prequest_payment
  if response.errors.present?
    raise response.errors.inspect
  end
  # 2. Make recurring profile
end
end

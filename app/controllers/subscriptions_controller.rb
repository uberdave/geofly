class SubscriptionsController < ApplicationController
  def new
    plan = Plan.find(params[:plan_id])
    
    @post = Post.find(params[:post_num])
    @subscription = plan.subscriptions.build

    if params[:PayerID]
      @subscription.post_num = @post.id
      @subscription.paypal_customer_token = params[:PayerID]
      @subscription.paypal_payment_token = params[:token]
      @subscription.email = @subscription.paypal.checkout_details.email
     
    end
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    
    
    if @subscription.save_with_payment
      redirect_to @subscription, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end
 
  def show
    @subscription = Subscription.find(params[:id])
  end
  
 def paypal_checkout
 
  plan = Plan.find(params[:plan_id])
  @link = params[:post_num]
  
  subscription = plan.subscriptions.build

  redirect_to subscription.paypal.checkout_url(
    return_url: new_subscription_url(:plan_id => plan.id,:post_num => @link),
    cancel_url: root_url)
end
def checkout_url(options)
  ppr = PayPal::Recurring.new(
    amount: plan.price,
    currency: "USD"
  ).merge(options)
 response = ppr.checkout
  if response.valid?
    redirect_to response.checkout_url
  else
    raise response.errors.inspect
  end
end
    
end

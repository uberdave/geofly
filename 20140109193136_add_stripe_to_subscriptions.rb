class AddStripeToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :stripe_customer_token, :string
  end
end

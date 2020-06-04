class PaymentNotification < ActiveRecord::Base
  attr_accessible :create, :params, :post_id, :status, :transaction_id
end

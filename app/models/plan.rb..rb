class Plan < ActiveRecord::Base
attr_accessible :name, :price, :quantity
  has_many :subscriptions
end

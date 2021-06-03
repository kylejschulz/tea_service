class Tea < ApplicationRecord
  has_many :subscriptionteas
  has_many :subscriptions, through: :subscriptionteas

  has_many :customers, through: :subscriptions 

end

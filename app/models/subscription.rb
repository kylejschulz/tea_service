class Subscription < ApplicationRecord
  has_many :customersubscriptions
  has_many :customers, through: :customersubscriptions

  has_many :subscriptionteas 
  has_many :teas, through: :subscriptionteas
end

class Customer < ApplicationRecord
  has_many :customersubscriptions
  has_many :subscriptions, through: :customersubscriptions

  has_many :teas, through: :subscriptions
end

class Subscription < ApplicationRecord
  validates_presence_of :title,
                        :price,
                        :status,
                        :frequency

  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  has_many :subscription_teas
  has_many :teas, through: :subscription_teas

  enum status: [:active, :cancelled]
end

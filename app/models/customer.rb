class Customer < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :email,
                        :address

  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions

  has_many :teas, through: :subscriptions

  def self.filter_subscription

  end
end

class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :status, :frequency
end

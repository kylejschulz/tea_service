class CustomerSubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :customer_id, :subscription_id
end

class Api::V1::CustomerSubscriptionsController < ApplicationController
  def index
    customer = Customer.find(customer_subscription_params[:customer_id])
    @subscriptions = customer.filter_subscriptions(params)
    if @subscriptions
      render json: SubscriptionSerializer.new(@subscriptions), status: 200
    else
      render json: {data: { error: "Customer not found"}}, status: 400
    end

  end

  def create
    subscription = CustomerSubscription.new(customer_id: customer_subscriptions_param[:customer_id], subscription_id:customer_subscription_params[:subscription_id])
    if subscription.save
      render json: CustomerSubscriptionSerializer.new(subscription), status: 201
    else
      render json: {data: { error: "unable to subscribe"}}, status: 400
    end
  end

  def update
    customer_subscription = CustomerSubscription.find_by(customer_id: customer_subscription_params[:customer_id], subscription_id:customer_subscription_params[:subscription_id])
    @subscription = customer_subscription.subscription

    if subscription.update(update_subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: 200
    else
      render json: {data: { error: "Subscription cannot be updated"}}, status: 400
    end
  end


  private

  def customer_subscription_params
    params.permit(:customer_id, :subscription_id, :id, :status)
  end

  def update_subscription_params
    params.permit(:status)
  end
end

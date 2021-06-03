class Api::V1::CustomerSubscriptionsController < ApplicationController
  def index
    require "pry"; binding.pry
  end

  def create
    require "pry"; binding.pry
    subscription = SubscriptionTea.new(customer_id: customer_subscriptions_params[:customer_id], subscription_id:customer_subscriptions_params[:subscription_id])
    if subscription.save
      render json: CustomerSerializer.new(subscription), status: 201
    else
      render json: {data: { error: "unable to subscribe"}}, status: 400
    end
  end

  def destroy
    require "pry"; binding.pry
    subscription = SubscriptionTea.new(customer_id: customer_subscriptions_params[:customer_id], subscription_id:customer_subscriptions_params[:subscription_id])
    subscription.status = 1
  end

  private

  def customer_subscriptions_params
    params.permit(:customer_id, :subscription_id, :id)
  end
end

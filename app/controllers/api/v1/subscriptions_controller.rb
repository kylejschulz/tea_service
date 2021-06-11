class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.all

    if subscriptions
      render json: SubscriptionSerializer.new(subscriptions), status: 200
    else
      render json: {data: { error: "no subscriptions available"}}, status: 400
    end
  end

  def show
    subscription = Subscription.find(subscription_params[:id])

    if subscription
      render json: SubscriptionSerializer.new(subscription), status: 200
    else
      render json: {data: { error: "Subscription not found"}}, status: 400
    end
  end

  private

  def subscription_params
    params.permit(:id)
  end
end

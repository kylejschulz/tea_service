class Api::V1::CustomerTeasController < ApplicationController
  def index
    require "pry"; binding.pry
    customer = Customer.find(customer_params)
        teas = Customer.all
    require "pry"; binding.pry

    if customers
      render json: CustomerSerializer.new(customers), status: 200
    else
      render json: {data: { error: "no customers available"}}, status: 400
    end
  end

  private

  def customer_params
    params.permit(:customer_id)
  end
end

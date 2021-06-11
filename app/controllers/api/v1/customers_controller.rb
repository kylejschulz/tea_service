class Api::V1::CustomersController < ApplicationController
  def index
    customers = Customer.all

    if customers
      render json: CustomerSerializer.new(customers), status: 200
    else
      render json: {data: { error: "no customers available"}}, status: 400
    end
  end
end

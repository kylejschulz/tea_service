class Api::V1::CustomerTeasController < ApplicationController
  def index
    customer = Customer.find(customer_params[:customer_id])
    teas = customer.unique_teas

    if teas
      render json: TeaSerializer.new(teas), status: 200
    else
      render json: {data: { error: "no teas available"}}, status: 400
    end
  end

  private

  def customer_params
    params.permit(:customer_id)
  end
end

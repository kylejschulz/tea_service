require 'rails_helper'

RSpec.describe "customer subscriptions create request" do
  before :each do
    make_teas
    @customer = Customer.first
    @subscription = Subscription.first
    first_three = Tea.all[0..2]
    @subscription.teas << first_three
  end
  describe "happy path" do
    it "can create a new subscription and return info about that subscription" do
      post "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}"
      expect(@response).to be_successful
      response = parse(@response)

      expect(response[:data].count).to eq(3)
      expect(response[:data].keys).to eq([:id, :type, :attributes])
      expect(response[:data][:id]).to be_a(String)
      expect(response[:data][:type]).to eq('customer_subscription')
      expect(response[:data][:attributes].keys).to eq([:customer_id, :subscription_id])
    end
  end

  describe "it can return sad paths" do
    it "returns 400 when given invalid customer ID" do
      post "/api/v1/customers/11111/subscriptions/#{@subscription.id}"

      expect(@response).to_not be_successful
      expect(@response.status).to eq(400)
      response = parse(@response)
      expect(response).to eq({:data=>{:error=>"unable to subscribe"}})
    end

    it "returns 400 when given invalid subscription ID" do
      post "/api/v1/customers/#{@customer.id}/subscriptions/11111111"

      expect(@response).to_not be_successful
      expect(@response.status).to eq(400)
      response = parse(@response)
      expect(response).to eq({:data=>{:error=>"unable to subscribe"}})
    end
  end
end

require 'rails_helper'

RSpec.describe "customer subscriptions index request" do
  before :each do
    make_teas
    @customer = Customer.first
    @subscription_1 = Subscription.first
    @subscription_2 = Subscription.second
    first_three = Tea.all[0..2]
    next_three = Tea.all[3..5]
    @subscription_1.teas << first_three
    @subscription_2.teas << next_three
    @customer.subscriptions << @subscription_1
    @customer.subscriptions << @subscription_2
    @subscription_2.status = 'cancelled'
  end

  describe "happy path" do
    it "can return in about all the customers subscriptions, active and cancelled" do
      get "/api/v1/customers/#{@customer.id}/subscriptions"
      expect(@response).to be_successful
      response = parse(@response)
      expect(response[:data].count).to eq(2)
      expect(response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(response[:data].first[:id]).to be_a(String)
      expect(response[:data].first[:type]).to eq('subscription')
      expect(response[:data].first[:attributes].keys).to eq([:title, :price, :status, :frequency])
      expect(response[:data].first[:attributes][:status]).to eq("active")
      # expect(response[:data].last[:attributes][:status]).to eq("cancelled")
    end
  end

  describe "it can return sad paths" do
    it "returns 404 when given integers" do
      get "/api/v1/customers/11111/subscriptions"

      expect(@response).to_not be_successful
      expect(@response.status).to eq(404)
      response = parse(@response)
      expect(response).to eq({:error=>"Couldn't find Customer with 'id'=11111"})

    end

    it "returns 404 when given jumbled letters" do
      get "/api/v1/customers/ljhafljh/subscriptions"

      expect(@response).to_not be_successful
      expect(@response.status).to eq(404)
      response = parse(@response)
      expect(response).to eq({:error=>"Couldn't find Customer with 'id'=ljhafljh"})
    end
  end
end

require 'rails_helper'

RSpec.describe "unique customer teas index request" do
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
    it "can return all the unique teas for a given customer" do
      get "/api/v1/customers/#{@customer.id}/teas"
      expect(@response).to be_successful
      response = parse(@response)
      expect(response[:data].count).to eq(6)
      expect(response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(response[:data].first[:id]).to be_a(String)
      expect(response[:data].first[:type]).to eq('tea')
      expect(response[:data].first[:attributes].keys).to eq([:title, :description, :temperature, :brew_time])
    end
  end

  describe "it can return sad paths" do
    it "returns 404 when given integers" do
      get "/api/v1/customers/11111/teas"

      expect(@response).to_not be_successful
      expect(@response.status).to eq(404)
      response = parse(@response)
      expect(response).to eq({:error=>"Couldn't find Customer with 'id'=11111"})

    end

    it "returns 404 when given jumbled letters" do
      get "/api/v1/customers/ljhafljh/teas"

      expect(@response).to_not be_successful
      expect(@response.status).to eq(404)
      response = parse(@response)
      expect(response).to eq({:error=>"Couldn't find Customer with 'id'=ljhafljh"})
    end
  end
end

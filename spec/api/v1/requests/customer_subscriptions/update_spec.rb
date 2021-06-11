require 'rails_helper'

RSpec.describe "customer subscriptions create request" do
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
  end

  describe "happy path" do
    it "can update an existing subscription and return info about that subscription" do
      expect(@subscription_2.status).to eq("active")

      put "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription_2.id}?status=cancelled"
      expect(@response).to be_successful
      response = parse(@response)

      expect(response[:data].count).to eq(3)
      expect(response[:data].keys).to eq([:id, :type, :attributes])
      expect(response[:data][:id]).to eq(@subscription_2.id.to_s)
      expect(response[:data][:type]).to eq('subscription')
      expect(response[:data][:attributes].keys).to eq([:title, :price, :status, :frequency])
      expect(response[:data][:attributes][:title]).to eq(@subscription_2.title)
      expect(response[:data][:attributes][:price]).to eq(@subscription_2.price)
      expect(response[:data][:attributes][:status]).to eq('cancelled')
      expect(response[:data][:attributes][:frequency]).to eq(@subscription_2.frequency)

    end
  end

  describe "it can return sad paths" do
    it "returns 422 when given empty string" do
      put "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription_2.id}?status= "

      expect(@response).to_not be_successful
      expect(@response.status).to eq(400)
      response = parse(@response)
      expect(response).to eq({:data=>{:error=>"Subscription cannot be updated"}})
    end

    it "returns 400 when given integers" do
      put "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription_2.id}?status=1234"

      expect(@response).to_not be_successful
      expect(@response.status).to eq(400)
      response = parse(@response)
      expect(response).to eq({:data=>{:error=>"Subscription cannot be updated"}})

    end

    it "returns 400 when given jumbled letters for status" do
      put "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription_2.id}?status=sljsdfljkhdfs"

      expect(@response).to_not be_successful
      expect(@response.status).to eq(400)
      response = parse(@response)
      expect(response).to eq({:data=>{:error=>"Subscription cannot be updated"}})
    end
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

require 'rails_helper'

RSpec.describe "subscription show spec" do
  before :each do
    make_teas
    @customer = Customer.first
    @subscription = Subscription.first
    first_three = Tea.all[0..2]
    @subscription.teas << first_three
  end
  describe "happy path" do
    it "can show an already existing subscription" do
      get "/api/v1/subscriptions/#{@subscription.id}"
      expect(@response).to be_successful
      response = parse(@response)
      expect(response[:data].count).to eq(3)
      expect(response[:data].keys).to eq([:id, :type, :attributes])
      expect(response[:data][:id]).to be_a(String)
      expect(response[:data][:type]).to eq('subscription')
      expect(response[:data][:attributes].keys).to eq([:title, :price, :status, :frequency])
    end
  end
end

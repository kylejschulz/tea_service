require 'rails_helper'

RSpec.describe "subscription index spec" do
  before :each do
    make_teas
    @customer = Customer.first
    @subscription_1 = Subscription.first
    @subscription_2 = Subscription.second
    first_three = Tea.all[0..2]
    next_three = Tea.all[3..5]
    @subscription_1.teas << first_three
    @subscription_2.teas << next_three
  end
  describe "happy path" do
    it "can show an index of all already existing subscription" do
      get "/api/v1/subscriptions"
      expect(@response).to be_successful
      response = parse(@response)

      expect(response[:data].count).to eq(10)
      expect(response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(response[:data].first[:id]).to be_a(String)
      expect(response[:data].first[:type]).to eq('subscription')

      expect(response[:data].first[:attributes].keys).to eq([:title, :price, :status, :frequency])
    end
  end
end

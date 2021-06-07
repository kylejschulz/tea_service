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
      require "pry"; binding.pry
      expect(@response).to be_successful
      response = parse(@response)

      expect(response[:data].count).to eq(3)
      expect(response[:data].keys).to eq([:id, :type, :attributes])
      expect(response[:data][:id]).to be_nil
      expect(response[:data][:type]).to eq('image')
      expect(response[:data][:attributes].keys).to eq([:image_url])
      expect(response[:data][:attributes][:image_url]).to eq('https://www.flickr.com/photos/mudsharkalex/51142231625/')
    end
  end
end

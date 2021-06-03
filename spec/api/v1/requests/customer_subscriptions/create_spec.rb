require 'rails_helper'

RSpec.describe "customer subscriptions create request" do
  before each: do
    make_teas
    @customer = Customer.first
    @subscription = Subscription.first
    first_three = Tea.all[0..2]
    @subscription.teas << first_three
    require "pry"; binding.pry
  end
  describe "happy path" do
    it "can create a new subscription and return info about that subscription", :vcr do
      post "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"
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
  
  describe "it can return sad paths" do
    it "returns 42 when given empty string", :vcr do
    end

    it "returns 42 when given integers", :vcr do
    end

    it "returns 42 when given jumbled letters", :vcr do
    end
  end
end

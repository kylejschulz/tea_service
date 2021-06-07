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

    # xit "can return all the data including for subscriptions that have been cancelled" do
    #   put "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription_2}?status=cancelled"
    #   get "/api/v1/customers/#{@customer.id}/subscriptions"
    #   require "pry"; binding.pry
    #   expect(@response).to be_successful
    #   response = parse(@response)
    #
    #   expect(response[:data].count).to eq(3)
    #   expect(response[:data].keys).to eq([:id, :type, :attributes])
    #   expect(response[:data][:id]).to be_nil
    #   expect(response[:data][:type]).to eq('image')
    #   expect(response[:data][:attributes].keys).to eq([:image_url])
    #   expect(response[:data][:attributes][:image_url]).to eq('https://www.flickr.com/photos/mudsharkalex/51142231625/')
    # end
  end

  describe "it can return sad paths" do
    xit "returns 42 when given empty string" do
    end

    xit "returns 42 when given integers" do
    end

    xit "returns 42 when given jumbled letters" do
    end
  end
end

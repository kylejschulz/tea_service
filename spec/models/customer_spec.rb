require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:address)}
  end
  describe "relationships" do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
  end

  before :each do
    make_teas
    @customer = Customer.first
    @subscription_1 = Subscription.first
    @subscription_2 = Subscription.second
    first_three = Tea.all[0..2]
    @tea_1 = Tea.all[0]
    @tea_2 = Tea.all[1]
    @tea_3 = Tea.all[2]
    @tea_4 = Tea.all[3]
    @tea_5 = Tea.all[4]
    @tea_6 = Tea.all[5]
    @tea_1.update!(brew_time: 1)
    @tea_2.update!(brew_time: 2)
    @tea_3.update!(brew_time: 3)
    @tea_4.update!(brew_time: 4)
    @tea_5.update!(brew_time: 5)
    @tea_6.update!(brew_time: 6)

    next_three = Tea.all[3..5]
    @subscription_1.teas << first_three
    @subscription_2.teas << next_three
    @customer.subscriptions << @subscription_1
    @customer.subscriptions << @subscription_2
    @subscription_2.update(status: 'cancelled')
  end

  describe "instance methods" do
    xit "#filtered_subscriptions" do
      require "pry"; binding.pry
      expect
    end

    it "#brew_time" do
      teas = @customer.brew_time(4)
      expect(teas.count).to eq(6)
    end

    xit "#status_filter" do
      cancelled_subs = @customer.status_filter("cancelled")
      active_subs = @customer.status_filter("active")
      expect(cancelled_subs).to eq(@subscription_2)
      expect(active_subs).to eq(@subscription_1)

    end

    it "#brew_time_and_status" do

    end

    it "#unique_teas" do

    end
  end
end

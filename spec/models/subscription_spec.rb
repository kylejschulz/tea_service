require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:status)}
    it { should validate_presence_of(:frequency)}
  end
  describe "relationships" do
    it { should have_many(:subscription_teas) }
    it { should have_many(:teas).through(:subscription_teas) }
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:customers).through(:customer_subscriptions) }
  end
end

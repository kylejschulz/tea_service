require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:status)}
    it { should validate_presence_of(:frequesncy)}
  end
  describe "relationships" do
    it { should have_many(:subscriptionteas) }
    it { should have_many(:teas).through(:subscriptionteas) }
    it { should have_many(:customersubscriptions) }
    it { should have_many(:customers).through(:customersubscriptions) }
  end
end

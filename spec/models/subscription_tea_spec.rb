require 'rails_helper'

RSpec.describe SubscriptionTea, type: :model do
  describe "relationships" do
    it { should belong_to(:subscription) }
    it { should belong_to(:tea) }
  end
end

require 'rails_helper'

RSpec.describe UserDecorator do
  describe "buyer" do
    let(:buyer) { FactoryBot.create(:buyer).decorate }

    it "should be decorate" do
      expect(buyer).to be_decorated_with UserDecorator
    end
  end
end

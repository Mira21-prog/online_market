require 'spec_helper'
require 'rails_helper'

describe BuyerPolicy do
  subject { BuyerPolicy }
  let(:current_user) { FactoryBot.create(:buyer) }
  let(:other_user) { FactoryBot.create(:buyer) }

  permissions :show? do
    it "allow you to see your own profile" do
      expect(subject).to permit(current_user, current_user)
    end

    it "prevent other user to see your own profile" do
      expect(subject).not_to permit(current_user, other_user)
    end
  end

  permissions :edit? do
    it "allow you to update your own profile" do
      expect(subject).to permit(current_user, current_user)
    end

    it "prevent other user to update your own profile" do
      expect(subject).not_to permit(current_user, other_user)
    end
  end
end

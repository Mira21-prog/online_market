require 'rails_helper'
include AuthHelper

RSpec.describe CalculateTotalPrice, type: :service do
  describe "#call" do
    let(:user) { FactoryBot.create(:buyer) }
    let(:category) { FactoryBot.create(:category) }

    context "return valid object from method call" do
      let(:apartment) { FactoryBot.create(:apartment, category: category) }
      let(:booking) { FactoryBot.build(:booking, apartment: apartment, buyer: user) }
      it "if valid booking date" do
        result = CalculateTotalPrice.call(checkin: booking.checkin, checkout: booking.checkout,
        adult: booking.adult, children: booking.children, infans: booking.infans,
        apartment: apartment, price: booking.total, user: user)
        expect(result.valid?).to eq true
      end

      it "adds a new booking to apartment" do
        expect { CalculateTotalPrice.call(checkin: booking.checkin, checkout: booking.checkout,
        adult: booking.adult, children: booking.children, infans: booking.infans,
        apartment: apartment, price: booking.total, user: user)}.to change(apartment.booking, :count).by(1)
      end
    end
    context "return valid object from method call" do
      let(:apartment) { FactoryBot.create(:apartment, category: category) }
      let(:booking) { FactoryBot.build(:booking, apartment: apartment, buyer: user) }
      it "if valid booking date" do
        result = CalculateTotalPrice.call(apartment: apartment, user: user)
        expect(result.valid?).to eq false
      end
    end

  end
end

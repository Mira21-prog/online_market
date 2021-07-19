require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { FactoryBot.create(:buyer) }
  let(:category) { FactoryBot.create(:category) }
  let(:apartment) { FactoryBot.create(:apartment, category: category)}
  let(:booking) { FactoryBot.create(:booking, apartment: apartment, buyer: user)}
  let(:payment) { FactoryBot.build(:payment, booking: booking)}

  describe "if valid payment datas" do
    it "with card_holder, cvv, card_number" do
       expect(payment).to be_valid
    end

    it "without card_holder" do
       payment.card_holder = nil
       expect(payment).to_not be_valid
    end
  end

  describe "if valid payment datas" do
    it "without cvv" do
      payment.cvv = nil
      expect(payment).to_not be_valid
    end

    it "without card_number" do
      payment.card_number = nil
      expect(payment).to_not be_valid
    end
  end

  context "if cvv valid data" do
    before do
      payment.cvv = 123
    end
    it "should be only 3 chapster in cvv" do
      expect(payment).to be_valid
    end
    it "should be only number in cvv" do
      expect(payment).to be_valid
    end
  end

  context "if cvv invalid date" do
    it "should not be sting in cvv" do
      payment.cvv = "test"
      payment.valid?
      expect(payment.errors[:cvv]).to include("is not a number")
    end
    it "should no be > 3 chapster" do
      payment.cvv = 12345
      payment.valid?
      expect(payment.errors[:cvv]).to include("is the wrong length (should be 3 characters)")
    end
  end

  context "if card number valid" do
    before do
      payment.card_number = 1234123412341234
    end
    it "should be only 16 chapster in cvv" do
      expect(payment).to be_valid
    end
    it "should be only number in card number" do
      expect(payment).to be_valid
    end
  end

  context "if card_number invalid" do
    it "should not be sting in card_number" do
      payment.card_number = "test"
      payment.valid?
      expect(payment.errors[:card_number]).to include("is not a number")
    end

    it "should no be < 12 chapster" do
      payment.card_number = 12341234
      payment.valid?
      expect(payment.errors[:card_number]).to include("is the wrong length (should be 16 characters)")
    end
  end
end

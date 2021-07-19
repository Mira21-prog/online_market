require 'rails_helper'
include AuthHelper
RSpec.describe PaymentsController, type: :controller do
  describe "#new" do
    let(:user) { FactoryBot.create(:buyer) }
    let(:category) { FactoryBot.create(:category) }

    context "if user is logged in" do
      let(:apartment) { FactoryBot.create(:apartment, category: category)}
      let(:booking) { FactoryBot.create(:booking, apartment: apartment, buyer: user)}
      it "then redirect to new page" do
        sign_in user
        get :new, params: {booking_id: booking.id}
        expect(response).to have_http_status 200
      end

      context "then fill out payment form" do
        let(:booking) { FactoryBot.create(:booking, apartment: apartment, buyer: user)}
        let(:payment) { FactoryBot.build(:payment, booking: booking)}
        it "with valid date" do
          sign_in user
          get :create, params: { payment: payment, booking_id: booking.id  }
          expect(response).to have_http_status 200
        end

        it "with invalid date" do
          payment.card_number = nil
          sign_in user
          get :create, params: { payment: payment, booking_id: booking.id  }
          expect(response).to render_template(:new)
        end
      end
    end

    context "if user is not logged in" do
      let(:apartment) { FactoryBot.create(:apartment, category: category)}
      let(:booking) { FactoryBot.create(:booking, apartment: apartment, buyer: user)}
      it "then redirect to root path" do
        get :new, params: { booking_id: booking.id }
        expect(response).to have_http_status 302
      end
    end
  end
end

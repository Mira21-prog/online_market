require 'rails_helper'
include AuthHelper
RSpec.describe BookingsController, type: :controller do
  describe "#index" do

    context "if user authorize" do
      let(:user) { FactoryBot.create(:buyer) }
      it "responds successfully" do
        sign_in user
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "if user unauthorize" do
      it "redirect to sign in page " do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#create" do
    let(:user) { FactoryBot.create(:buyer) }
    let(:category) { FactoryBot.create(:category) }

    context "if valid booking date" do
      let(:apartment) { FactoryBot.create(:apartment, category: category)}
      let(:booking) { FactoryBot.create(:booking, apartment: apartment, buyer: user)}
      it "redirect to payment page" do
        sign_in user
        post :create, params: { checkin: booking.checkin, checkout: booking.checkout,
        adult: booking.adult, children: booking.children, infans: booking.infans,
        price: apartment.price, apartment: apartment, user: user, apartment_id: apartment.id }
        expect(response).to have_http_status 302
      end
    end

    context "if invalid booking date" do
      let(:apartment) { FactoryBot.create(:apartment, category: category)}
      it "then stay on booking page" do
        sign_in user
        post :create, params: { apartment_id: apartment.id, checkout: nil,
        adult: nil, children: nil, infans: nil, price: nil, apartment: apartment, user: user }
        expect(response).to render_template "apartments/show"
      end
    end

  end
end

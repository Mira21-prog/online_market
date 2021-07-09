require 'rails_helper'
include AuthHelper

RSpec.describe ApartmentsController, type: :controller do
  describe "GET /show" do
    let(:buyer) { FactoryBot.create(:buyer) }
    let(:apartment) { FactoryBot.create(:apartment) }

    context "action if user loged in " do
      before do
        login_user(buyer)
        get :show, params: { id: apartment.id }
      end

      it "returns http success" do
        expect(response).to have_http_status(200)
      end

      it "render apartment template" do
        expect(response).to render_template(:show)
      end
    end

    context "action if user log out " do
      subject { get :show, params: { id: apartment.id } }
      it "redirect to root path" do
        expect(subject).to have_http_status 302
      end
    end
  end
end

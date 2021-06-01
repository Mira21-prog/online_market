require 'rails_helper'
include AuthHelper

RSpec.describe UsersController, type: :controller do
  describe "GET /show" do
    let(:buyer) { FactoryBot.create(:buyer) }

    before do
      login_user(buyer)
    end

    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "user should be current user" do
      get :show
      expect(controller.current_user).to eq(buyer)
    end

    it "current user should not be nil" do
      get :show
      expect(controller.current_user).to_not be_nil
    end

    it "current user should buyer" do
      get :show
      expect(controller.current_user.type).to eq('Buyer')
    end
  end
end

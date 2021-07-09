require 'rails_helper'
include AuthHelper

RSpec.describe Apartment, type: :model do

  describe "check valid element" do
    let(:apartment) { FactoryBot.create(:apartment) }
  end


end

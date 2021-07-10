require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(
    first_name: "Aeron",
    last_name: "Sumner",
    email: "tester@example.com",
    phone_number: "12345",
    password: "test23",
    type: "Buyer",
    uid: "123445",
    provider: "test"
  ) }
  it "is valid with a first name, last name, email, password" do
    expect(user).to be_valid
  end

  it "is invalid without first name " do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end
  it "is invalid without last_name " do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid with duplicate email address" do
    User.create(
      first_name: "Joe",
      last_name: "Tester",
      email: "tester@example.com",
      phone_number: "12345",
      password: "test23",
      type: "Buyer",
      uid: "123445",
      provider: "test"
    )
    user = User.new(
      first_name: "Joe",
      last_name: "Tester",
      email: "tester@example.com",
      phone_number: "12345",
      password: "test23",
      type: "Buyer",
      uid: "123445",
      provider: "test"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a user's full name as string" do
    user = User.new(first_name: "Tony", last_name: "Adam")
    expect(user.first_name).to be_an_instance_of String
    expect(user.last_name).to be_an_instance_of String
  end

  it "return a user's full name as a string" do
    expect(user.name).to eq "Aeron Sumner"
  end

  it "return user is buyer" do
    expect(user.type).to eq "Buyer"
  end
end

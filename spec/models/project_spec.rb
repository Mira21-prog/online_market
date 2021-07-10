require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:user) { User.create(
    first_name: "Aeron", last_name: "Sumner",
    email: "tester@example.com", phone_number: "12345",
    password: "test23", type: "Buyer",
    uid: "123445", provider: "test") }

  let(:other_user) { User.create(
      first_name: "Aeron", last_name: "Sumner",
      email: "tester@example.com", phone_number: "12345",
      password: "test23", type: "Buyer",
      uid: "123445", provider: "test") }

  it "does not allow duplicate project name per user" do
    user.projects.create(
      name: "Test Project"
    )
    new_project = user.projects.create(
      name: "Test Project"
    )
    new_project.valid?
    expect(new_project.errors[:email]).to include("has already been taken")
  end

  it "allow two user to share a project name " do
    other_project = other_user.projects.build(name: "Test Project")
    expect(other_project).to be_valid
  end

end

require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { User.create(first_name: "Aeron", last_name: "Sumner",
    email: "tester@example.com", phone_number: "12345", password: "test23",
    type: "Buyer", uid: "123445", provider: "test") }

  let(:new_project) { user.projects.create(name: "Test Project") }
  let(:note1) { new_project.notes.create(message: "First messages", user: user) }
  let(:note2) { new_project.notes.create(message: "Also first messages", user: user) }
  let(:note3) { new_project.notes.create(message: "Second messages", user: user) }

  it "returns notes that match the search term" do
    expect(Note.search("first")).to include(note1, note2)
  end

  it "returns notes that don't match the search term" do
    expect(Note.search("first")).to_not include(note3)
  end
  it "return an empty collection when no results are found" do
    expect(Note.search("messages")).to be_empty
  end
end

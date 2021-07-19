require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    let(:user) { User.create(first_name: "Aeron", last_name: "Sumner",
    email: "tester@example.com", phone_number: "12345", password: "test23",
    type: "Buyer", uid: "123445", provider: "test") }
    let(:project) { user.projects.create(name: "Test Project") }
  end

  let(:note1) { new_project.notes.create(message: "First messages", user: user) }
  let(:note2) { new_project.notes.create(message: "Also first messages", user: user) }
  let(:note3) { new_project.notes.create(message: "Second messages", user: user) }

  it "is valid with a user, project and message" do
    let(:note) { Note.new(
        message: "This is sample note. ",
        user: @user,
        project: project) }
    expect(note).to be_valid
  end

  it "is invalid without a message" do
    note = Note.new(message: nil)
    note.valid?
    expect(note.errors[:message]).to include("can't be blank")
  end

  describe "search message for a term" do
    before do
      let(:note1) { new_project.notes.create(message: "First messages", user: user) }
      let(:note2) { new_project.notes.create(message: "Also first messages", user: user) }
      let(:note3) { new_project.notes.create(message: "Second messages", user: user) }
    end
    context "when a match is found" do
      it "returns notes that match" do
        expect(Note.search("first")).to include(note1, note2)
      end
    end

    context "when a match is not found" do
      it "returns notes that don't match" do
        expect(Note.search("first")).to_not include(note3)
      end
      it "return an empty collection " do
        expect(Note.search("messages")).to be_empty
      end
    end
  end
end

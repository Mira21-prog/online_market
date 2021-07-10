require 'rails_helper'
include AuthHelper
RSpec.describe RandomCharacterGenerator do

    describe "#new_character" do
        # NOTE: Do NOT create your test variables this way!! (See comments for why.) This is just an example for readability...
        let(:starting_datebase_count) { Character.count }
        let(:player) { Player.create(user_name: "Ronald McDonald", display_name: "Mac") }
        let(:character) { rcg = RandomCharacterGenerator.new  rcg.new_character("Ronnie the Rat", player)}
        let(:dublicate) { rcg.new_character("Ronnie the Rat", player) }

        context "success" do
          it { expect(character).to be_an_instance_of Character }
          end
        end

        context "failure (non-unique) name" do
          it "returns a messsages that Character is not created" do
            expect(character).to be_an_instance_of Character
            expect(duplicate).to eq "Character not created -- name already exists!"
          end
        end

        it "randomly allocates all #{rcg.points_pool} stat points between #{rcg.stats_array.to_s}" do
          expect(rcg.stats_array.reduce(0) {|points, stat| points += character[stat] }).to eq rcg.points_pool
        end

        it "allocates stat points so stat values are between 1 and max roll (#{rcg.max_roll})" do
          expect(character.strength).to be_between(1, rcg.max_roll)
          expect(character.sexterity).to be_between(1, rcg.max_roll)
          expect(character.intelligence).to be_between(1, rcg.max_roll)
        end

        it "saves the Character to the database" do
            expect(Character.count).to eq (starting_database_count + 1)
        end
    end
end

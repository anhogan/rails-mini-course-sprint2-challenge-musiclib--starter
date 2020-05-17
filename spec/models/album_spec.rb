require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "validations" do
    it "is valid" do
      album = Album.new(name: 'My First Album')

      result = album.valid?
      errors = album.errors.full_messages

      expect(result).to be true
      expect(errors.count).to be 0
    end

    it "is invalid without a name" do
      album = Album.new(name: nil)

      result = album.valid?
      errors = album.errors.full_messages

      expect(result).to be false
      expect(errors.count).to be > 0
    end
  end

  describe "attributes" do
    it "has expected attributes" do
      attributes = Album.new(name: 'My First Album').attribute_names

      expect(attributes).to contain_exactly("id", "name", "available", "artist_id", "created_at", "updated_at")
    end
  end

  context "scopes" do
    describe "available" do
      before do
        Album.create!( { name: "First", available: true } )
        Album.create!( { name: "Second", available: false } )
        Album.create!( { name: "Third", available: true } )
        Album.create!( { name: "Fourth", available: true } )
        Album.create!( { name: "Fifth", available: false } )
      end

      it "returns a list of available albums sorted by name" do
        results = Album.available

        expect(results.count).to eq 3
        expect(results.first.name).to eq "First"
        expect(results.last.name).to eq "Fourth"
      end
    end
  end

  describe "#length_seconds" do
    it "calculates the total length in seconds of an album" do
      album = Album.new(name: 'My First Album', id: 1)
      songOne = Song.new(title: 'Beginning', length_seconds: 180, track_number: 1, album_id: 1)
      songTwo = Song.new(title: 'Middle', length_seconds: 200, track_number: 2, album_id: 1)
      songThree = Song.new(title: 'Eng', length_seconds: 220, track_number: 3, album_id: 1)

      expect(album).to eq 600
    end
  end
end

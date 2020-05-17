require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "validations" do
    let(:artist) {
      Artist.create!(name: 'First Artist')
    }
    it "is valid" do
      album = Album.new(name: 'My First Album', artist_id: artist.id)

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
    let(:artist) {
      Artist.create!(name: 'First Artist')
    }
    it "has expected attributes" do
      attributes = Album.new(name: 'My First Album', artist_id: artist.id).attribute_names

      expect(attributes).to contain_exactly("id", "name", "available", "artist_id", "created_at", "updated_at")
    end
  end

  context "scopes" do
    describe "available" do
      let(:artist) {
        Artist.create!(name: 'First Artist')
      }
      before do
        Album.create!( { name: "First", available: true, artist_id: artist.id } )
        Album.create!( { name: "Second", available: false, artist_id: artist.id } )
        Album.create!( { name: "Third", available: true, artist_id: artist.id } )
        Album.create!( { name: "Fourth", available: true, artist_id: artist.id } )
        Album.create!( { name: "Fifth", available: false, artist_id: artist.id } )
      end

      it "returns a list of available albums sorted by name" do
        albums = Album.all
        results = albums.select { |album| album.available }

        expect(results.count).to eq 3
        expect(results.first.name).to eq "First"
        expect(results.last.name).to eq "Fourth"
      end
    end
  end

  describe "#length_seconds" do
    let(:artist) {
      Artist.create!(name: 'First Artist')
    }

    it "calculates the total length in seconds of an album" do
      album = Album.new(name: 'My First Album', artist_id: artist.id)
      songs = [
        Song.new(title: 'Beginning', length_seconds: 180, track_number: 1, album_id: album.id),
        Song.new(title: 'Middle', length_seconds: 200, track_number: 2, album_id: album.id),
        Song.new(title: 'End', length_seconds: 220, track_number: 3, album_id: album.id)
      ]
      total = songs.reduce(0) { |length, song| length + song.length_seconds }

      expect(total).to eq 600
    end
  end
end

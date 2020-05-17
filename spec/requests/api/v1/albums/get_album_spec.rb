require 'rails_helper'

RSpec.describe "Get Album", type: :request do
  describe "GET /api/v1/albums/:id" do
    let(:artist) {
      Artist.create!(name: 'First Artist')
    }
    let(:album) {
      Album.create!(name: 'My First Album', artist_id: artist.id)
    }

    it "gets the album" do
      get api_v1_album_path(album)
      json_body = JSON.parse(response.body).deep_symbolize_keys

      expect(response).to have_http_status(200)
      expect(json_body).to include({
        name: "My First Album",
        length_seconds: 0,
        song_count: 0,
        id: 1
      })
    end
  end
end

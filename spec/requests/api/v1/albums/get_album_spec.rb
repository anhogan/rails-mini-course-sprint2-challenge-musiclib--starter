require 'rails_helper'

RSpec.describe "Get Album", type: :request do
  describe "GET /api/v1/albums/:id" do
    let(:album) {
      Album.create!(name: 'My First Album', available: true)
    }

    it "gets the album" do
      get api_v1_album_path(album)
      json_body = JSON.parse(response.body).deep_symbolize_keys

      expect(response).to have_http_status(200)
      expect(response_body).to include({
        name: "My First Album",
        available: true
      })
    end
  end
end

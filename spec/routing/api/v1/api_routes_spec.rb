require "rails_helper"

RSpec.describe "API Routes", type: :routing do
  context "api" do
    context "v1" do
      describe "albums" do
        context "valid routes" do
          it { expect(:get => "/api/v1/albums").to route_to("api/v1/albums#index") }
          it { expect(:get => "/api/v1/albums/1").to route_to("api/v1/albums#show", :id => "1") }
        end

        context "invalid routes" do
          it { expect(:post => "/api/v1/albums").not_to route_to("api/v1/albums#create") }
          it { expect(:put => "/api/v1/albums/1").not_to route_to("api/v1/albums#update", :id => "1") }
          it { expect(:patch => "/api/v1/albums/1").not_to route_to("api/v1/albums#update", :id => "1") }
          it { expect(:delete => "/api/v1/albums/1").not_to route_to("api/v1/albums#update", :id => "1") }
        end

        describe "album songs" do
          context "valid routes" do
            it { expect(:get => "/api/v1/albums/1/songs").to route_to("api/v1/songs#index", :album_id => "1") }
          end

          context "invalid routes" do
            it { expect(:post => "/api/v1/albums/1/songs").not_to route_to("api/v1/songs#create", :album_id => "1") }
            it { expect(:get => "/api/v1/albums/1/songs/1").not_to route_to("api/v1/songs#show", :album_id => "1", :id => "1") }
            it { expect(:put => "/api/v1/albums/1/songs/1").not_to route_to("api/v1/songs#update", :album_id => "1", :id => "1") }
            it { expect(:patch => "/api/v1/albums/1/songs/1").not_to route_to("api/v1/songs#update", :album_id => "1", :id => "1") }
            it { expect(:delete => "/api/v1/albums/1/songs/1").not_to route_to("api/v1/songs#destroy", :album_id => "1", :id => "1") }
          end
        end
      end

      describe "artists" do
        context "valid routes" do
          it { expect(:get => "/api/v1/artists").to route_to("api/v1/artists#index") }
          it { expect(:get => "/api/v1/artists/1").to route_to("api/v1/artists#show", :id => "1") }
        end

        context "invalid routes" do
          it { expect(:post => "/api/v1/artists").not_to route_to("api/v1/artists#create") }
          it { expect(:put => "/api/v1/artists/1").not_to route_to("api/v1/artists#update", :id => "1") }
          it { expect(:patch => "/api/v1/artists/1").not_to route_to("api/v1/artists#update", :id => "1") }
          it { expect(:delete => "/api/v1/artists/1").not_to route_to("api/v1/artists#destroy", :id => "1") }
        end

        describe "artist albums" do
          context "valid routes" do
            it { expect(:get => "/api/v1/artists/1/albums").to route_to("api/v1/albums#index", :artist_id => "1") }
          end

          context "invalid routes" do
            it { expect(:post => "/api/v1/artists/1/albums").not_to route_to("api/v1/albums#create", :artist_id => "1") }
            it { expect(:get => "/api/v1/artists/1/albums/1").not_to route_to("api/v1/albums#show", :artist_id => "1", :id => "1") }
            it { expect(:put => "/api/v1/artists/1/albums/1").not_to route_to("api/v1/albums#update", :artist_id => "1", :id => "1") }
            it { expect(:patch => "/api/v1/artists/1/albums/1").not_to route_to("api/v1/albums#update", :artist_id => "1", :id => "1") }
            it { expect(:delete => "/api/v1/artists/1/albums/1").not_to route_to("api/v1/albums#delete", :artist_id => "1", :id => "1") }
          end
        end
      end

      describe "playlists" do
        context "valid routes" do
          it { expect(:get => "/api/v1/playlists/1").to route_to("api/v1/playlists#show", :id => "1") }
        end

        context "invalid routes" do
          it { expect(:get => "/api/v1/playlists").not_to route_to("api/v1/playlists#index") }
          it { expect(:post => "/api/v1/playlists").not_to route_to("api/v1/playlists#create") }
          it { expect(:put => "/api/v1/playlists/1").not_to route_to("api/v1/playlists#update", :id => "1") }
          it { expect(:patch => "/api/v1/playlists/1").not_to route_to("api/v1/playlists#update", :id => "1") }
          it { expect(:delete => "/api/v1/playlists/1").not_to route_to("api/v1/playlists#destroy", :id => "1") }
        end

        describe "playlist songs" do
          context "valid routes" do
            it { expect(:get => "/api/v1/playlists/1/songs").to route_to("api/v1/songs#index", :playlist_id => "1") }
            it { expect(:post => "/api/v1/playlists/1/songs").to route_to("api/v1/songs#create", :playlist_id => "1") }
          end

          context "invalid routes" do
            it { expect(:get => "/api/v1/playlists/1/songs/1").not_to route_to("api/v1/songs#show", :playlist_id => "1", :id => "1") }
            it { expect(:put => "/api/v1/playlists/1/songs/1").not_to route_to("api/v1/songs#update", :playlist_id => "1", :id => "1") }
            it { expect(:patch => "/api/v1/playlists/1/songs/1").not_to route_to("api/v1/songs#update", :playlist_id => "1", :id => "1") }
            it { expect(:delete => "/api/v1/playlists/1/songs/1").not_to route_to("api/v1/songs#destroy", :playlist_id => "1", :id => "1") }
          end
        end
      end

      describe "songs" do
        context "valid routes" do
          it { expect(:get => "/api/v1/songs").to route_to("api/v1/songs#index") }
          it { expect(:get => "/api/v1/songs/1").to route_to("api/v1/songs#show", :id => "1") }
        end

        context "invalid routes" do
          it { expect(:post => "/api/v1/songs").not_to route_to("api/v1/songs#create") }
          it { expect(:put => "/api/v1/songs/1").not_to route_to("api/v1/songs#update", :id => "1") }
          it { expect(:patch => "/api/v1/songs/1").not_to route_to("api/v1/songs#update", :id => "1") }
          it { expect(:delete => "/api/v1/songs/1").not_to route_to("api/v1/songs#destroy", :id => "1") }
        end
      end

      describe "users" do
        context "valid routes" do
          it { expect(:get => "/api/v1/users").to route_to("api/v1/users#index") }
          it { expect(:post => "/api/v1/users").to route_to("api/v1/users#create") }
          it { expect(:get => "/api/v1/users/1").to route_to("api/v1/users#show", :id => "1") }
        end

        context "invalid routes" do
          it { expect(:put => "/api/v1/users/1").not_to route_to("api/v1/users#update", :id => "1") }
          it { expect(:patch => "/api/v1/users/1").not_to route_to("api/v1/users#update", :id => "1") }
          it { expect(:delete => "/api/v1/users/1").not_to route_to("api/v1/users#destroy", :id => "1") }
        end

        describe "user playlists" do
          context "valid routes" do
            it { expect(:get => "/api/v1/users/1/playlists").to route_to("api/v1/playlists#index", :user_id => "1") }
            it { expect(:post => "/api/v1/users/1/playlists").to route_to("api/v1/playlists#create", :user_id => "1") }
          end

          context "invalid routes" do
            it { expect(:get => "/api/v1/users/1/playlists/1").not_to route_to("api/v1/playlists#show", :user_id => "1", :id => "1") }
            it { expect(:put => "/api/v1/users/1/playlists/1").not_to route_to("api/v1/playlists#update", :user_id => "1", :id => "1") }
            it { expect(:patch => "/api/v1/users/1/playlists/1").not_to route_to("api/v1/playlists#update", :user_id => "1", :id => "1") }
            it { expect(:delete => "/api/v1/users/1/playlists/1").not_to route_to("api/v1/playlists#destroy", :user_id => "1", :id => "1") }
          end
        end
      end
    end
  end
end

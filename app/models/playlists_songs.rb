class PlaylistSong < ApplicationRecord
  belongs_to :playlists, :songs
end
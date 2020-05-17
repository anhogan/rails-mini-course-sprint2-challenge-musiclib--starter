class User < ApplicationRecord
  has_many :playlists
  
  validates :email, :api_key, presence: true
end

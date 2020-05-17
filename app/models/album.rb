class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true

  scope :available, -> { where(available: true).order(:name) }

  def length_seconds
    songs.reduce(0) { |length, song| length + song.length_seconds }
  end
end

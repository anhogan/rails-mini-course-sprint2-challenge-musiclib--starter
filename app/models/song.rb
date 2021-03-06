class Song < ApplicationRecord
  belongs_to :album

  validates :track_number, :length_seconds, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :title, presence: true
end

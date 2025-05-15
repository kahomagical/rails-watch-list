class Bookmark < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :list, dependent: :destroy

  validates :comment, length: { minimum: 6 }
  # A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
  validates :movie, presence: true, uniqueness: { scope: [ :movie, :list ] }
  validates :list, presence: true
end

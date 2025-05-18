class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 7 }
  # A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
  validates :movie, presence: true, uniqueness: { scope: :list }
end

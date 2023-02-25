class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id, message: 'has already been bookmarked' }
  validates :comment, length: { minimum: 6, message: 'your comment should have at least 6 characters' }
end

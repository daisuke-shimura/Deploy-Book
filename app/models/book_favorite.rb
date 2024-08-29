class BookFavorite < ApplicationRecord

  belongs_to :user
  belongs_to :book

  validates :user_id, uniquenss: {scope: :book_id}
end

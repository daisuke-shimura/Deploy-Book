class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :book_favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

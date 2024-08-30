class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :book_favorites, dependent: :destroy

  def favorited_by?(n)
    book_favorites.exists?(user_id: n.id)
  end

  def comment_by?(user)
    book_comments.exists?(user_id: user.id)
  end

end

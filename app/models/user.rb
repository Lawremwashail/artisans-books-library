class User < ApplicationRecord
  has_secure_password

  has_many :borrowings
  has_many :books, through: :borrowings

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def currently_borrowed_books
    borrowings.where(returned: false).includes(:book).map(&:book)
  end
end

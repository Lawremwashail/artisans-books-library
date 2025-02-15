class Book < ApplicationRecord
    has_many :borrowings
    has_many :users, through: :borrowings
  
    validates :title, :author, :isbn, presence: true
    validates :isbn, uniqueness: true
    validates :published_date, presence: true
    validates :summary, length: { maximum: 500 }


    def available?
        borrowings.where(returned: false).empty?
    end
  end
  
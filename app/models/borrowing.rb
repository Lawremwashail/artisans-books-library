class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true

  before_validation :set_due_date, on: :create  # Run before validation to ensure presence

  private

  def set_due_date
    self.due_date ||= Date.today + 14.days  # Only set if not already present
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with a name, email, and password" do
      user = User.new(name: "John Doe", email: "john@example.com", password: "password")
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = User.new(email: "john@example.com", password: "password")
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = User.new(name: "John Doe", password: "password")
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid if the email is not unique" do
      User.create!(name: "Original User", email: "john@example.com", password: "password")
      duplicate_user = User.new(name: "Duplicate User", email: "john@example.com", password: "password")

      expect(duplicate_user).not_to be_valid
      expect(duplicate_user.errors[:email]).to include("has already been taken")
    end
  end

  describe "#currently_borrowed_books" do
    let(:user) { User.create!(name: "John Doe", email: "john@example.com", password: "password") }
    let(:book1) { Book.create!(title: "Book One", author: "Author A", isbn: "1234567890", published_date: Date.today) }
    let(:book2) { Book.create!(title: "Book Two", author: "Author B", isbn: "0987654321", published_date: Date.today) }

    it "returns books that are currently borrowed (not returned)" do
      Borrowing.create!(user: user, book: book1, due_date: Date.today + 7.days, returned: false)
      Borrowing.create!(user: user, book: book2, due_date: Date.today + 14.days, returned: true)

      expect(user.currently_borrowed_books).to include(book1)
      expect(user.currently_borrowed_books).not_to include(book2)
    end

    it "returns an empty array if the user has no active borrowings" do
      expect(user.currently_borrowed_books).to be_empty
    end
  end
end

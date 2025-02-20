require 'rails_helper'

RSpec.describe Borrowing, type: :model do
  let(:user) { User.create!(name: "John Doe", email: "john@example.com", password: "password") }
  let(:book) { Book.create!(title: "Test Book", author: "Test Author", isbn: "1234567890", published_date: Date.today) }

  describe "validations" do
    it "is valid with a user, book, and due date" do
      borrowing = Borrowing.new(user: user, book: book, due_date: Date.today + 14.days)
      expect(borrowing).to be_valid
    end

    it "sets a default due date if none is provided" do
        borrowing = Borrowing.create!(user: user, book: book)
        expect(borrowing.due_date).to eq(Date.today + 14.days)
    end
  end

  describe "associations" do
    it "belongs to a user" do
      borrowing = Borrowing.create!(user: user, book: book, due_date: Date.today + 14.days)
      expect(borrowing.user).to eq(user)
    end

    it "belongs to a book" do
      borrowing = Borrowing.create!(user: user, book: book, due_date: Date.today + 14.days)
      expect(borrowing.book).to eq(book)
    end
  end

  describe "callbacks" do
    it "sets the due date automatically if not provided" do
      borrowing = Borrowing.new(user: user, book: book)
      borrowing.save
      expect(borrowing.due_date).to eq(Date.today + 14.days)
    end
  end
end

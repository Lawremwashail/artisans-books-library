require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      book = Book.new(
        title: "Test Book",
        author: "Test Author",
        isbn: "1234567890",
        published_date: Date.new(2024, 1, 1),
        summary: "This is a test summary."
      )
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = Book.new(author: "Test Author", isbn: "1234567890", published_date: Date.new(2024, 1, 1))
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end

    it "is invalid without an author" do
      book = Book.new(title: "Test Book", isbn: "1234567890", published_date: Date.new(2024, 1, 1))
      expect(book).not_to be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end

    it "is invalid without an ISBN" do
      book = Book.new(title: "Ruby Programming", author: "John Doe", published_date: Date.today)
      expect(book).not_to be_valid
      expect(book.errors[:isbn]).to include("can't be blank")
    end

    it "is invalid with a duplicate ISBN" do
      Book.create!(title: "Original Book", author: "Author One", isbn: "1234567890", published_date: Date.new(2024, 1, 1))
      duplicate_book = Book.new(title: "Duplicate Book", author: "Author Two", isbn: "1234567890", published_date: Date.new(2024, 1, 1))

      expect(duplicate_book).not_to be_valid
      expect(duplicate_book.errors[:isbn]).to include("has already been taken")
    end

    it "is invalid if summary exceeds 500 characters" do
      long_summary = "a" * 501
      book = Book.new(title: "Test Book", author: "Test Author", isbn: "1234567890", published_date: Date.new(2024, 1, 1), summary: long_summary)

      expect(book).not_to be_valid
      expect(book.errors[:summary]).to include("is too long (maximum is 500 characters)")
    end
  end

  describe "#available?" do
    it "returns false when there is an unreturned borrowing" do
      user = User.create!(name: "Test User", email: "test@example.com", password: "password")
      book = Book.create!(
        title: "Ruby Programming",
        author: "John Doe",
        isbn: "123-456-789",
        published_date: Date.today
      )
      Borrowing.create!(user: user, book: book, returned: false)

      expect(book.available?).to be_falsey
    end

    it "returns true when all borrowings are returned" do
      user = User.create!(name: "Test User", email: "test@example.com", password: "password")
      book = Book.create!(
        title: "Ruby Programming",
        author: "John Doe",
        isbn: "123-456-789",
        published_date: Date.today
      )
      Borrowing.create!(user: user, book: book, returned: true)

      expect(book.available?).to be_truthy
    end
  end
end

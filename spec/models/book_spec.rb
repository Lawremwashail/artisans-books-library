require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      book = FactoryBot.build(:book)
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = FactoryBot.build(:book, title: nil)
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end

    it "is invalid without an author" do
      book = FactoryBot.build(:book, author: nil)
      expect(book).not_to be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end

    it "is invalid without an ISBN" do
      book = FactoryBot.build(:book, isbn: nil)
      expect(book).not_to be_valid
      expect(book.errors[:isbn]).to include("can't be blank")
    end

    it "is invalid with a duplicate ISBN" do
      FactoryBot.create(:book, isbn: "1234567890") # Create a book with this ISBN
      duplicate_book = FactoryBot.build(:book, isbn: "1234567890")

      expect(duplicate_book).not_to be_valid
      expect(duplicate_book.errors[:isbn]).to include("has already been taken")
    end

    it "is invalid if summary exceeds 500 characters" do
      long_summary = "a" * 501
      book = FactoryBot.build(:book, summary: long_summary)

      expect(book).not_to be_valid
      expect(book.errors[:summary]).to include("is too long (maximum is 500 characters)")
    end
  end

  describe "#available?" do
    let(:user) { FactoryBot.create(:user) }
    let(:book) { FactoryBot.create(:book) }

    it "returns false when there is an unreturned borrowing" do
      FactoryBot.create(:borrowing, user: user, book: book, returned: false)

      expect(book.available?).to be_falsey
    end

    it "returns true when all borrowings are returned" do
      FactoryBot.create(:borrowing, user: user, book: book, returned: true)

      expect(book.available?).to be_truthy
    end
  end
end

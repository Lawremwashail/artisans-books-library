RSpec.describe Borrowing, type: :model do
    let(:user) { FactoryBot.create(:user) }
    let(:book) { FactoryBot.create(:book) }
  
    describe "validations" do
      it "is valid with a user, book, and due date" do
        borrowing = FactoryBot.build(:borrowing, user: user, book: book, due_date: Date.today + 14.days)
        expect(borrowing).to be_valid
      end
  
      it "sets a default due date if none is provided" do
        borrowing = FactoryBot.create(:borrowing, user: user, book: book)
        expect(borrowing.due_date).to eq(Date.today + 14.days)
      end
    end
  
    describe "associations" do
      it "belongs to a user" do
        borrowing = FactoryBot.create(:borrowing, user: user, book: book)
        expect(borrowing.user).to eq(user)
      end
  
      it "belongs to a book" do
        borrowing = FactoryBot.create(:borrowing, user: user, book: book)
        expect(borrowing.book).to eq(book)
      end
    end
 end
  
RSpec.describe User, type: :model do
    describe "validations" do
      it "is valid with a name, email, and password" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
  
      it "is invalid without a name" do
        user = FactoryBot.build(:user, name: nil)
        expect(user).not_to be_valid
        expect(user.errors[:name]).to include("can't be blank")
      end
  
      it "is invalid without an email" do
        user = FactoryBot.build(:user, email: nil)
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("can't be blank")
      end
  
      it "is invalid if the email is not unique" do
        FactoryBot.create(:user, email: "john@example.com")
        duplicate_user = FactoryBot.build(:user, email: "john@example.com")
        expect(duplicate_user).not_to be_valid
        expect(duplicate_user.errors[:email]).to include("has already been taken")
      end
    end
  
    describe "#currently_borrowed_books" do
      let(:user) { FactoryBot.create(:user) }
      let(:book1) { FactoryBot.create(:book) }
      let(:book2) { FactoryBot.create(:book) }
  
      it "returns books that are currently borrowed (not returned)" do
        FactoryBot.create(:borrowing, user: user, book: book1, due_date: Date.today + 7.days, returned: false)
        FactoryBot.create(:borrowing, user: user, book: book2, due_date: Date.today + 14.days, returned: true)
  
        expect(user.currently_borrowed_books).to include(book1)
        expect(user.currently_borrowed_books).not_to include(book2)
      end
  
      it "returns an empty array if the user has no active borrowings" do
        expect(user.currently_borrowed_books).to be_empty
      end
    end
end
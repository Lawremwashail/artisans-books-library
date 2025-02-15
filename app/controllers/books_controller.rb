class BooksController < ApplicationController
  before_action :require_login, only: [:index, :show, :borrow]
  before_action :set_book, only: [:show, :borrow, :return_book]
  
  def index
    @books = Book.all
  end

  def borrow    
  
    if @book.available?
      borrowing = Borrowing.new(user: current_user, book: @book, returned: false)
  
      if borrowing.save
        @book.update(available: false)
        redirect_to profile_path, notice: "You have borrowed #{@book.title}."
      else
        redirect_to books_path, alert: "Something went wrong: #{borrowing.errors.full_messages.join(', ')}"
      end
    else
      redirect_to books_path, alert: "Book is already borrowed."
    end
  end

  def return_book
    borrowing = current_user.borrowings.find_by(book: @book, returned: false)
    
    if borrowing
      borrowing.update(returned: true)
      @book.update(available: true) # Mark book as available again
      redirect_to profile_path, notice: "You have returned #{@book.title}."
    else
      redirect_to profile_path, alert: "Book not found or already returned."
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "You must be logged in to borrow books."
    end
  end
end

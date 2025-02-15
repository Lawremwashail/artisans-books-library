# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.create([
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald", isbn: "9780743273565" },
  { title: "To Kill a Mockingbird", author: "Harper Lee", isbn: "9780061120084" },
  { title: "1984", author: "George Orwell", isbn: "9780451524935" },
  { title: "Pride and Prejudice", author: "Jane Austen", isbn: "9781503290563" },
  { title: "The Catcher in the Rye", author: "J.D. Salinger", isbn: "9780316769488" },
  { title: "Moby-Dick", author: "Herman Melville", isbn: "9781503280786" },
  { title: "War and Peace", author: "Leo Tolstoy", isbn: "9781420959712" },
  { title: "The Hobbit", author: "J.R.R. Tolkien", isbn: "9780547928227" },
  { title: "Crime and Punishment", author: "Fyodor Dostoevsky", isbn: "9780486415871" },
  { title: "The Lord of the Rings", author: "J.R.R. Tolkien", isbn: "9780618640157" }
])

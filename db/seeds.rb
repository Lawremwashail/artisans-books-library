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
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald", isbn: "9780743273565", published_date: "1925-04-10", summary: "A novel set in the Jazz Age that critiques the American Dream." },
  { title: "To Kill a Mockingbird", author: "Harper Lee", isbn: "9780061120084", published_date: "1960-07-11", summary: "A story of racial injustice and childhood innocence in the American South." },
  { title: "1984", author: "George Orwell", isbn: "9780451524935", published_date: "1949-06-08", summary: "A dystopian novel about a totalitarian regime that uses surveillance and propaganda to control its citizens." },
  { title: "Pride and Prejudice", author: "Jane Austen", isbn: "9781503290563", published_date: "1813-01-28", summary: "A romantic novel that explores themes of love, class, and social reputation." },
  { title: "The Catcher in the Rye", author: "J.D. Salinger", isbn: "9780316769488", published_date: "1951-07-16", summary: "A coming-of-age story following the disillusioned teenager Holden Caulfield." },
  { title: "Moby-Dick", author: "Herman Melville", isbn: "9781503280786", published_date: "1851-10-18", summary: "A whaling adventure that explores themes of obsession, revenge, and fate." },
  { title: "War and Peace", author: "Leo Tolstoy", isbn: "9781420959712", published_date: "1869-01-01", summary: "An epic novel that intertwines history, politics, and personal stories during the Napoleonic Wars." },
  { title: "The Hobbit", author: "J.R.R. Tolkien", isbn: "9780547928227", published_date: "1937-09-21", summary: "A fantasy adventure following Bilbo Baggins on his quest to reclaim treasure from a dragon." },
  { title: "Crime and Punishment", author: "Fyodor Dostoevsky", isbn: "9780486415871", published_date: "1866-01-01", summary: "A psychological novel exploring guilt and redemption after a murder." },
  { title: "The Lord of the Rings", author: "J.R.R. Tolkien", isbn: "9780618640157", published_date: "1954-07-29", summary: "A high fantasy epic about the battle against an evil dark lord." }, 
  { title: "Brave New World", author: "Aldous Huxley", isbn: "9780060850524", published_date: "1932-08-30", summary: "A dystopian novel envisioning a future society driven by consumerism and genetic engineering." },
  { title: "Jane Eyre", author: "Charlotte Brontë", isbn: "9780141441146", published_date: "1847-10-16", summary: "A novel exploring themes of morality, love, and independence." },
  { title: "Wuthering Heights", author: "Emily Brontë", isbn: "9780141439556", published_date: "1847-12-01", summary: "A gothic tale of passion, revenge, and supernatural elements." },
  { title: "The Picture of Dorian Gray", author: "Oscar Wilde", isbn: "9780141442464", published_date: "1890-06-20", summary: "A novel about vanity and moral corruption as a young man's portrait ages instead of him." },
  { title: "Frankenstein", author: "Mary Shelley", isbn: "9780486282114", published_date: "1818-01-01", summary: "A classic gothic novel about the consequences of playing god through scientific ambition." },
  { title: "Dracula", author: "Bram Stoker", isbn: "9780486411095", published_date: "1897-05-26", summary: "A horror novel about Count Dracula’s attempt to spread vampirism to England." },
  { title: "The Brothers Karamazov", author: "Fyodor Dostoevsky", isbn: "9780374528379", published_date: "1880-01-01", summary: "A philosophical novel exploring faith, doubt, and morality in a dysfunctional family." },
  { title: "Anna Karenina", author: "Leo Tolstoy", isbn: "9780143035008", published_date: "1878-01-01", summary: "A tragic love story about a woman torn between passion and social expectations." },
  { title: "Fahrenheit 451", author: "Ray Bradbury", isbn: "9781451673319", published_date: "1953-10-19", summary: "A dystopian story about a future where books are outlawed and burned." },
  { title: "One Hundred Years of Solitude", author: "Gabriel García Márquez", isbn: "9780060883287", published_date: "1967-05-30", summary: "A magical realism novel that follows the rise and fall of the Buendía family." },
  { title: "The Count of Monte Cristo", author: "Alexandre Dumas", isbn: "9780140449266", published_date: "1844-01-01", summary: "A thrilling tale of revenge, justice, and redemption." },
  { title: "Don Quixote", author: "Miguel de Cervantes", isbn: "9780060934347", published_date: "1605-01-16", summary: "A comedic and tragic novel about an aging man who believes he is a knight." },
  { title: "Les Misérables", author: "Victor Hugo", isbn: "9780451419439", published_date: "1862-04-03", summary: "A historical novel about justice, redemption, and love in revolutionary France." },
  { title: "The Stranger", author: "Albert Camus", isbn: "9780679720201", published_date: "1942-01-01", summary: "An existentialist novel about a detached man who is tried for murder." },
  { title: "Catch-22", author: "Joseph Heller", isbn: "9781451626650", published_date: "1961-11-10", summary: "A satirical war novel exposing the absurdity of bureaucratic logic." },
  { title: "Slaughterhouse-Five", author: "Kurt Vonnegut", isbn: "9780440180296", published_date: "1969-03-31", summary: "A blend of sci-fi and war fiction, following a soldier unstuck in time." },
  { title: "The Sun Also Rises", author: "Ernest Hemingway", isbn: "9780743297332", published_date: "1926-10-22", summary: "A novel about the Lost Generation’s post-WWI disillusionment and travels." },
  { title: "Beloved", author: "Toni Morrison", isbn: "9781400033416", published_date: "1987-09-02", summary: "A novel exploring the haunting legacy of slavery in America." },
  { title: "The Grapes of Wrath", author: "John Steinbeck", isbn: "9780143039433", published_date: "1939-04-14", summary: "A novel about a family’s struggles during the Great Depression." },
  { title: "The Alchemist", author: "Paulo Coelho", isbn: "9780061122415", published_date: "1988-01-01", summary: "A philosophical novel about a shepherd’s journey to fulfill his dreams." }
])


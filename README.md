# Online Library 📚

An online library system for discovering, borrowing, and managing books.

## Features
- Browse available books with real-time availability status
- View book details, including title, author, and ISBN
- Borrow books (with a due date set 2 weeks from the borrowing date)
- Return borrowed books
- User authentication (Signup, Login, Logout)
- Profile page displaying borrowed books
- Model validations (e.g., title/author/ISBN presence, unique ISBN)
- Error handling to prevent borrowing an already borrowed book

## Setup Instructions
### 1. Clone the Repository
```bash
git clone git@github.com:Lawremwashail/artisans-books-library.git
cd artisans-books-library
```

### 2. Install Dependencies and Set Up the Database
```bash
bundle install
rails db:create db:migrate db:seed
```

### 3. Start the Server
```bash
rails server
```
The application will be available at:
```
http://localhost:3000
```

### 4. Application Routes
- `/signup` - User Registration
- `/login` - User Login
- `/books` - View all available books
- `/profile` - User profile with a list of borrowed books

## Running Tests
To ensure the application is functioning correctly, run:
```bash
rspec
```
This will execute model, controller, and view tests to maintain high test coverage.

## Implementation Details
- Built using **Ruby on Rails 8**, utilizing its default authentication system.
- Users can **browse books**, **borrow available books**, and **return borrowed books**.
- Each borrowing creates a **Borrowing record** associating the **User** and **Book**, with a **due date** (set to **2 weeks from borrowing date**).
- Implemented **model validations** for book attributes and borrowing constraints.
- Includes **automated tests** for models, controllers, and views using **RSpec**.

## Contribution & Support
In case of any issues or missing information, feel free to reach out via email.
Thank you and welcome!

## GitHub Repository
[GitHub URL](https://github.com/Lawremwashail/artisans-books-library)


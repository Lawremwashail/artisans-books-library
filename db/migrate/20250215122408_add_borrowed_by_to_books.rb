class AddBorrowedByToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :borrowed_by, :integer
  end
end

class AddPublishedDateToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :published_date, :date
  end
end

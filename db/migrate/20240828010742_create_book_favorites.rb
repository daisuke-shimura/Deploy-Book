class CreateBookFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :book_favorites do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :book_comment_id

      t.timestamps
    end
  end
end

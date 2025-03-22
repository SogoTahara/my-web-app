class ChangeUserIdOnBooksToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :books, :user_id, false
  end
end

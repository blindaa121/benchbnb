class AddUserUniquess < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true
    add_index :users, :password_digest, unique: true
  end
end

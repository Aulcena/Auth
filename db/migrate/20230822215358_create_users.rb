class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: true
      t.string :session_token, null: true
      t.timestamps

      add_index :users, :username
    end
  end
end

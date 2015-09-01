class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_username
      t.string :user_password
      t.string :user_email

      t.timestamps null: false
    end
  end
end

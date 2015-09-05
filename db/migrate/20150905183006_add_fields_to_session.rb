class AddFieldsToSession < ActiveRecord::Migration
  def change
    add_reference :sessions, :user_id, index: true, foreign_key: true
    add_column :sessions, :key, :string
    add_column :sessions, :logged_in, :boolean
  end
end

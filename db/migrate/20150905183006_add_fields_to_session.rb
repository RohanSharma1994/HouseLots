class AddFieldsToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :user_id, :integer
    add_column :sessions, :key, :string
    add_column :sessions, :logged_in, :boolean
  end
end

class RenameSessionToSessionManager < ActiveRecord::Migration
  def change
  	rename_table :sessions, :session_tablets
  end
end

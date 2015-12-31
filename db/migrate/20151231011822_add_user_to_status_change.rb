class AddUserToStatusChange < ActiveRecord::Migration
  def change
    add_reference :status_changes, :user, index: true, foreign_key: true
  end
end

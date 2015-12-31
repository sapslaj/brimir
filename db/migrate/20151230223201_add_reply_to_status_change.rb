class AddReplyToStatusChange < ActiveRecord::Migration
  def change
    add_reference :status_changes, :reply, index: true, foreign_key: true
  end
end

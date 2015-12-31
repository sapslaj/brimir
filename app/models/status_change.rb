class StatusChange < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :reply
  belongs_to :user

  enum status: Ticket.statuses

  scope :ordered, -> {
    order(:created_at)
  }

  def user
    # Get the user from the database. If it's nil, get the reply user. If that's nil, get the ticket user.
    User.find(read_attribute(:user_id) || (reply ? reply.user : ticket.user))
  end
end

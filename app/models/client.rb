class Client < ActiveRecord::Base
  has_many :tickets, dependent: :destroy

  scope :ordered, -> {
    order(:name)
  }
end

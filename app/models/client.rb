class Client < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  fuzzily_searchable :name, :address, :phone_number

  scope :ordered, -> {
    order(:name)
  }

  def self.search(query, *fields)
    fields = [:name] if fields.empty?
    fields.map do |field|
      send("find_by_fuzzy_#{field}", query)
    end.flatten
  end

  def open_tickets
    tickets.where(status: 0).order(:updated_at).reverse_order
  end

  def closed_tickets
    tickets.where(status: 1).order(:updated_at).reverse_order
  end
end

class AddEmailAddressToClients < ActiveRecord::Migration
  def change
    add_column :clients, :email_address, :string
  end
end

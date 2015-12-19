json.array!(@clients) do |client|
  json.extract! client, :id, :name, :address, :phone_number, :notes
  json.url client_url(client, format: :json)
end

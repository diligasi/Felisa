json.array!(@guests) do |guest|
  json.extract! guest, :id, :name, :accompanying_number
  json.url guest_url(guest, format: :json)
end

json.array!(@rooms) do |room|
  json.extract! room, :name, :description, :capacity, :floor
  json.url room_url(room, format: :json)
end

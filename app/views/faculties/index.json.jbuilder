json.array!(@faculties) do |faculty|
  json.extract! faculty, :name, :description
  json.url faculty_url(faculty, format: :json)
end

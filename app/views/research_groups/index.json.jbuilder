json.array!(@research_groups) do |research_group|
  json.extract! research_group, :name
  json.url research_group_url(research_group, format: :json)
end

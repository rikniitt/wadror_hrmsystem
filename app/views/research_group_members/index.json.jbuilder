json.array!(@research_group_members) do |research_group_member|
  json.extract! research_group_member, :employee_id, :research_group_id
  json.url research_group_member_url(research_group_member, format: :json)
end

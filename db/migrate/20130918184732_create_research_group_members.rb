class CreateResearchGroupMembers < ActiveRecord::Migration
  def change
    create_table :research_group_members do |t|
      t.integer :employee_id
      t.integer :research_group_id

      t.timestamps
    end
  end
end

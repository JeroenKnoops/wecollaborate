class CreateProjectSkill < ActiveRecord::Migration
  def change
    create_table :project_skills do |t|
      t.integer :project_id
      t.integer :skill_id
      t.integer :weight

      t.timestamps
    end
  end
end

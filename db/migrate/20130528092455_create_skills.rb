class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title

      t.timestamps
    end
    
    ["Graphic Design", "Web Programming", "Entrapeneurship", "Bicycle repair", "Engineering", "App Development", "Photography", "Dance", "Film", "Carpentry", "Welding", "Plumbing"].each do |s|
      Skill.create title: s
    end
    
  end
end

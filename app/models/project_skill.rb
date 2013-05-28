class ProjectSkill < ActiveRecord::Base
  attr_accessible :project_id, :skill_id, :weight
  
  belongs_to :project
  belongs_to :skill
  
end

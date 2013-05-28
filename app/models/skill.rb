class Skill < ActiveRecord::Base
  attr_accessible :title
  
  has_many :project_skills
  has_many :projects, :through => :project_skills
  
end

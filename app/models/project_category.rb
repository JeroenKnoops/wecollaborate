class ProjectCategory < ActiveRecord::Base
  attr_accessible :project_id, :category_id, :weight
  
  belongs_to :project
  belongs_to :category
  
end

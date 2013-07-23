class Timeline < ActiveRecord::Base

  attr_accessible :description, :is_public, :project_id, :timestamp, :title, :user_id
  
  
  def self.activities(user)
    self.where(:user => user)
  end
end

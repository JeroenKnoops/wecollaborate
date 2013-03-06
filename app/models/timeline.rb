class Timeline < ActiveRecord::Base
  include PublicActivity::Model

  attr_accessible :description, :is_public, :project_id, :timestamp, :title, :user_id
  
  after_create :create_activity_record
  
  def create_activity_record
    self.create_activity(:created_timeline)
  end
  
  def self.activities
    PublicActivity::Activity.order("created_at desc") #.where(owner_id: current_user.friend_ids, owner_type: "User")
    
  end
end

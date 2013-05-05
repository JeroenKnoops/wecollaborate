class Timeline < ActiveRecord::Base
  include PublicActivity::Model

  attr_accessible :description, :is_public, :project_id, :timestamp, :title, :user_id
  
  after_create :create_activity_record
  
  def create_activity_record
    self.create_activity(:created_timeline)
  end
  
  def self.activities(user)
    if user
      PublicActivity::Activity.order("created_at desc").where(owner_id: user.friend_ids + [user.id], owner_type: "User")
    else
      PublicActivity::Activity.order("created_at desc")
    end    
  end
end

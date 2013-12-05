class User < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :fullname, :email
  # attr_accessible :title, :body

  validates_presence_of :fullname
  
  scope :recent, lambda {|number| order("created_at desc").limit(number)}
  
  has_many :projects
  
  def to_s
    email
  end
end

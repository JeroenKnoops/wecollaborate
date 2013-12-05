class User < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :fullname, :email, :password, :password_confirmation, :remember_me, :email_confirmation, :newsletter
  # attr_accessible :title, :body

  validates :email, confirmation: true
  validates_presence_of :fullname
  
  scope :recent, lambda {|number| order("created_at desc").limit(number)}
  
  has_many :projects
  
  def to_s
    email
  end
end

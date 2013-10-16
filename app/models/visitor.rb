class Visitor < ActiveRecord::Base
  attr_accessible  :name, :email, :email_confirmation, :speciality_one, :speciality_two, :speciality_three, :project_title, :project_description, :jam, :newsletter, :visitor_type

  attr_accessor :visitor_type
  
  validates_presence_of :name
  
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }, confirmation: true
  
  validates_presence_of :speciality_one, :if => :visitor_join?

  validates_presence_of :project_title, :project_description, :if => :visitor_start?
    
  def visitor_join?
    visitor_type == "2"
  end

  def visitor_start?
    visitor_type == "3"
  end

end

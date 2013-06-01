class Project < ActiveRecord::Base
  attr_accessible :project_image_url, :project_small_image_url, :details, :initiator_id, :phase_id, :phrase, :title, :project_type, :status, :skill_ids, :category_ids
  
  belongs_to :initiator, :class_name => "User", :foreign_key => "initiator_id"

  belongs_to :phase

  has_many :project_skills
  has_many :skills, :through => :project_skills
  accepts_nested_attributes_for :project_skills

  has_many :project_categories
  has_many :categories, :through => :project_categories
  accepts_nested_attributes_for :project_categories
  
  scope :recent, lambda {|number| order("created_at desc").limit(number)}
  scope :inactive, where(:status => false)
  scope :active, where(:status => true)
  
  validates :project_image_url, :presence => true
  validates :initiator_id, :presence => true
  validates :phase_id, :presence => true
  validates :phrase, :presence => true
  validates :title, :presence => true
  validates :project_type, :presence => true
  validates :status, :presence => true
  
  def self.default
    where(:title => "Bike Club").first || 1
  end
  
  def other_projects
    Project.where("projects.id != ? and projects.status = ?", self.id, true)
  end
end

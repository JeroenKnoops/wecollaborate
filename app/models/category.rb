class Category < ActiveRecord::Base
  attr_accessible :title, :sort_order

  has_many :project_categories
  has_many :projects, :through => :project_categories
  
end

class Phase < ActiveRecord::Base
  attr_accessible :title, :sort_order, :color
  
  has_many :projects
end

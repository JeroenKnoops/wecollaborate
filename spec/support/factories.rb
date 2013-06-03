FactoryGirl.define do
  
  factory :user, aliases: [:initiator] do
    email "jeroen@example.com"
    password "blurking"
    fullname "Jeroen Knoops"
  end
  
  factory :phase do
    title                   "Concept"
    sort_order              1
    color                   "red"
  end

  factory :project do
    title                   "Bike Club"
    project_image_url       "projects/test-project.png"
    project_small_image_url "projects/test-project-small.png"
    initiator            
    phase
    phrase "This is a test-project"
    project_type "non-profit"
    details "This is an <b>html</b> text field"
    status 1
  end
  
  # create_table "project_categories", :force => true do |t|
  #   t.integer  "project_id"
  #   t.integer  "category_id"
  #   t.integer  "weight"
  #   t.datetime "created_at",  :null => false
  #   t.datetime "updated_at",  :null => false
  # end
  # 
  # create_table "project_skills", :force => true do |t|
  #   t.integer  "project_id"
  #   t.integer  "skill_id"
  #   t.integer  "weight"
  #   t.datetime "created_at", :null => false
  #   t.datetime "updated_at", :null => false
  # end
  # 
  # create_table "skills", :force => true do |t|
  #   t.string   "title"
  #   t.datetime "created_at", :null => false
  #   t.datetime "updated_at", :null => false
  # end
  
  
end
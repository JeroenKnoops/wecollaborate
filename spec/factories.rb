FactoryGirl.define do
  factory :timeline do
    title       "Timeline entry"
    description "This is a timeline entry"
    is_public   true
    user_id     nil
    project_id  nil
    timestamp   1.day.ago
  end
end
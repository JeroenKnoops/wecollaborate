Given(/^a user visits the timeline page$/) do
  visit timeline_path
end

Given(/^there are (\d+) timeline entries$/) do |number_of_timeline_entries|
  number_of_timeline_entries.to_i.times do
    FactoryGirl.create(:timeline)
  end
end

Then(/^he should see (\d+) timeline blocks$/) do |number_of_timeline_entries|
  page.all('.timeline_entry').count.should eql number_of_timeline_entries.to_i
end


require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  describe "Home page" do
    before { 
      create :project
      visit home_path 
    }
    it { should have_selector('div', text: 'Our community') }
  end
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_selector('div', text: 'What is WeCollaborate?') }
  end
  
end
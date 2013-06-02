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
  
  describe "Help page" do
    before { visit help_path }
    
    it { should have_selector('h1', text: 'Help') }
  end

  describe "About page" do
    before { visit about_path }
    
    it { should have_selector('div', text: 'What is WeCollaborate?') }
  end

  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_selector('h1', text: 'Contact') }
  end

  describe "under construction page" do
    before { visit construction_path }
    it { should have_selector('div', text: 'This page is under construction!') }
  end
  
end
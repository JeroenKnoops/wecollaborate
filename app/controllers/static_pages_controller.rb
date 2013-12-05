class StaticPagesController < ApplicationController
  
  def home
    @project = Project.active.first
  end

  def about
    @css_body_id = 'about_page'
  end
  
end

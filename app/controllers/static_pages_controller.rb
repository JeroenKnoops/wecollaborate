class StaticPagesController < ApplicationController
  def home
    @project = Project.active.first
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def about_creative_commons_policy
  end

  def terms_and_conditions
  end

  def beta
  end
  
  def construction
  end
  
end

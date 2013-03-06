class StaticPagesController < ApplicationController
  def home
    render layout: 'landing'
  end

  def help
  end

  def about
  end

  def contact
  end

end

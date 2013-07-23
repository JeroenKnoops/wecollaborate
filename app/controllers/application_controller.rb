class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_mode
  
  private
  
  def set_mode
    if params[:mode]
      if params[:mode] == "full"
        cookies[:mode] = "full"
        cookies[:mode] = { :value => "full", :expires => 2.hours.from_now }
      else
        cookies.delete :mode
      end
    end
    @mode = cookies[:mode] ? :full : :normal
  end
end

class VisitorsController < ApplicationController
  
  def index
    redirect_to :action => :new
  end

  def new
    @visitor, @visitor2, @visitor3 = Visitor.new, Visitor.new, Visitor.new
  end
  
  def create
    visitor = Visitor.create(params[:visitor])
    if visitor.save
      redirect_to root_url, :notice => "Thank you! We will inform you!"
    else
      @visitor, @visitor2, @visitor3 = Visitor.new, Visitor.new, Visitor.new
      case visitor.visitor_type
      when "2"
        @visitor2 = visitor
      when "3"
        @visitor3 = visitor
      else
        @visitor = visitor
      end
      render :action => 'new'
    end
  end
end

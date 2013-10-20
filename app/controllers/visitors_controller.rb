class VisitorsController < ApplicationController
  
  before_filter :set_signup_header
  
  def index
    redirect_to :action => :new
  end

  def new
    @visitor = {}
    @visitor[:join], @visitor[:keep], @visitor[:project] = Visitor.new, Visitor.new, Visitor.new
  end

  def ddw
    @visitor = {}
    @visitor[:join], @visitor[:keep], @visitor[:project] = Visitor.new, Visitor.new, Visitor.new
    @visitor[:jams] = []
    23.times{|n| @visitor[:jams] << "Creative Jam #{n + 1}"}
    @ddw = true
    render :action => 'new'
  end
  
  def create
    visitor = Visitor.create(params[:visitor])
    if visitor.save
      if create_from_ddw?
        redirect_to '/ddw', :notice => "Thank you! We will inform you!"
      else
        redirect_to root_url, :notice => "Thank you! We will inform you!"
      end
    else
      @visitor = {}
      @visitor[:join], @visitor[:keep], @visitor[:project] = Visitor.new, Visitor.new, Visitor.new
      if create_from_ddw?
        @ddw = true
        @visitor[:jams] = []
        23.times{|n| @visitor[:jams] << "Creative Jam #{n + 1}"}
      end
      case visitor.visitor_type
      when "2"
        @visitor[:join] = visitor
      when "3"
        @visitor[:project] = visitor
      else
        @visitor[:keep] = visitor
      end
      render :action => 'new'
    end
  end
  
  private
  
  def set_signup_header
    @signup = true
  end
  
  def create_from_ddw?
    !params[:visitor][:jam].blank?
  end
end

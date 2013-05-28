class ProjectsController < ApplicationController
  def index
    @projects = Project.active
  end
    
  def show
    @project = Project.find(params[:id])
  end
end

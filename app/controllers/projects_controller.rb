class ProjectsController < ApplicationController
  def index
    @projects = Project.active
  end
    
  def show
    @project = Project.find(params[:id])
    @other_projects = @project.other_projects
  end
end

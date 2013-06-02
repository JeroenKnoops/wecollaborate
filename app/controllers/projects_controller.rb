class ProjectsController < ApplicationController
  def index
    redirect_to Project.default
  end
    
  def show
    @project = Project.find(params[:id])
    @other_projects = @project.other_projects
  end
end

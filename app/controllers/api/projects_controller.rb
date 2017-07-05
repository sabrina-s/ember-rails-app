class Api::ProjectsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
    render json: @projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to api_projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to api_projects_path
  end

  def destroy
    @project.destroy
    redirect_back(fallback_location: api_projects_path)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

end
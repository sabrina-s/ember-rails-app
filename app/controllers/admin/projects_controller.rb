class Admin::ProjectsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_project, only: [:edit, :show, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to admin_projects_path
  end

  def destroy
    @project.destroy
    redirect_back(fallback_location: admin_projects_path)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :url)
  end

end
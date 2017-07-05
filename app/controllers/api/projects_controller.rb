class Api::ProjectsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @projects = Project.all
    render json: @projects
  end

end
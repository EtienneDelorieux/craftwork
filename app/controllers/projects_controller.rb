class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def index
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :content, :city)
  end

end

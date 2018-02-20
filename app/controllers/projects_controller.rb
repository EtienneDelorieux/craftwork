class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to projects_path, notice: "Your project was successfuly created!"
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def show

  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path, notice: "Your project was successfuly updated!"
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :content, :category_id, :city)
  end
end

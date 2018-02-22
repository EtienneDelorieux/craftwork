class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to project_path(@project), notice: "Your project was successfuly created!"
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @user = @project.user
    @review = Review.where(creator_id: @user).first
    @applications = Application.where(project_id: @project.id)
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project), notice: "Your project was successfuly updated!"
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :content, :category_id, :city, :photo)
  end
end

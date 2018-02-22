class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    if @project.save
      redirect_to project_path(@project), notice: "Your project was successfuly created!"
    else
      render :new
    end
  end

  def index
    @project = policy_scope(Project)
    # @projects = Project.all => on reporte la responsabilité de
    # l'authorisation dans le le policy controller
  end

  def show
    @user = @project.user
    @review = Review.where(creator_id: @user).first
    @applications = Application.where(project_id: @project.id).where(selected: true)
    if @applications.empty?
      @applications = Application.where(project_id: @project.id)
    end
    @application = @project.applications.build
    # @application = Application.new(project: @project)
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
    authorize @project
  end

  def project_params
    params.require(:project).permit(:title, :content, :category_id, :city, :photo)
  end
end

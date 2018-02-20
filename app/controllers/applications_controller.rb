class ApplicationsController < ApplicationController
  def index
  end

  def new
    @project = Project.find(params[:project_id])
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @project = Project.find(params[:project_id])
    @application.project = @project
    @application.user = current_user
    if @application.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def application_params
    params
      .require(:application)
      .permit(
        :quote,
        :comment,
        :estimated_duration,
        :selected,
        :application_id,
        :project_id
      )
  end
end



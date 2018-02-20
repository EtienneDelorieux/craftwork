class ApplicationsController < ApplicationController
  def index
  end

  def new
    @project = Project.find(params[:project_id])
    @application = Application.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def application_params
    params.require(:application).permit(:quote, :comment, :estimated_duration, :selected)
  end

end

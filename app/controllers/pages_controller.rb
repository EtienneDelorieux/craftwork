class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @projects = Project.global_search(params[:query])
    else
      @projects = Project.all
    end
  end
end

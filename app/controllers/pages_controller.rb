class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      sql_query = " \
        projects.title @@ :query \
        OR projects.content @@ :query \
        OR categories.name @@ :query \
      "
      @projects = Project.joins(:category).where(sql_query, query: "%#{params[:query]}%")
    else
      @projects = Project.all
    end
  end
end

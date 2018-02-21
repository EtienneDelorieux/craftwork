class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @project = Project.find(params[:project_id])
    @review.creator = @project.user
    @review.category = @project.category
    @application = Application.where(project_id: params[:project_id]).where(selected: true)
    raise
    @review.destinator = @application.user
    # raise
  end

  def create
    @project = Project.find(params[:project_id])
    @review = Review.new(review_params)
    @review.creator = current_user
    @review.category = @project.category
    if @review.save
      redirect_to project_path(@project)
    else
      ap @review.errors
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating, :creator_id, :destinator_id, :creator_id)
  end

end

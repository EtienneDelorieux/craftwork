class ReviewsController < ApplicationController

  before_action :set_review, only: [:new]

  def new
    ap @review
    authorize @review
  end

  def create
    puts "i'm here"
    @review = Review.new(review_params)
    @project = Project.find(params[:project_id])
    @application = Application.where(project_id: params[:project_id]).where(selected: true).first
    @review.category = @project.category
    @review.destinator = @application.user
    @review.creator = @project.user
    authorize @review
    if @review.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating, :creator_id, :destinator_id, :creator_id)
  end

  def set_review
    @review = Review.new
    @project = Project.find(params[:project_id])
  end
end

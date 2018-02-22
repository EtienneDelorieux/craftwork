module ApplicationHelper
  def average(user)
    if !user.reviews.empty?
      @stars = []
      user.reviews.each { |review| @stars << review.stars }
      @stars.inject(&:+) / @stars.size
    else
      0
    end
  end
end

module ApplicationHelper
  def average(user)
    if !user.reviews.empty?
      @rating = []
      user.reviews.each { |review| @rating << review.rating }
      @rating.inject(&:+) / @rating.size
    else
      0
    end
  end
end

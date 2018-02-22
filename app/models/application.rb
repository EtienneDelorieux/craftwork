class Application < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :comment, presence: true
  validates :quote, presence: true
  validates :start_date, presence: true
  validates :estimated_duration, presence: true

  def self.policy_class
    SubmissionPolicy
  end

end

class Vote < ActiveRecord::Base
  belongs_to :submission
  belongs_to :player
  validates :positive, :inclusion => {:in => [true, false]}

  validates_presence_of :submission, :player

  POINTS_PER_UPVOTE = 3
  POINTS_PER_DOWNVOTE = -3

  def score
    self.positive? ? POINTS_PER_UPVOTE : POINTS_PER_DOWNVOTE
  end
end

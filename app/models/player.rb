class Player < ActiveRecord::Base
  validates_presence_of :fbuid

  has_many :submissions
  has_many :votes

  def self.initialize_from_facebook(fb_user)
    player = Player.new
    player.name = fb_user.name
    player.fbuid = fb_user.raw_attributes[:id]
  end


  BASE_POINTS_PER_SUBMISSION = 10
  POINTS_PER_VOTE_CAST = 1

  def score
    # This scoring algorithm is in flux. We calculate from scratch for everything for now.

    submission_points = self.submissions.count * BASE_POINTS_PER_SUBMISSION
    cast_vote_points = self.votes.count * POINTS_PER_VOTE_CAST
    vote_points = self.submissions.collect(&:votes).collect(&:score).sum

    submission_points + cast_vote_points + vote_points
  end

end

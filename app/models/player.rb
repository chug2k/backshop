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
    ret = {}
    ret[:submissions] = self.submissions.count * BASE_POINTS_PER_SUBMISSION
    ret[:votes_cast] = self.votes.count * POINTS_PER_VOTE_CAST
    ret[:votes_received] = self.submissions.collect(&:votes).flatten.collect(&:score).sum

    ret
  end


  def facebook_image
    "http://graph.facebook.com/#{self.fbuid}/picture"
  end
end

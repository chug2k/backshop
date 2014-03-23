class Player < ActiveRecord::Base
  validates_presence_of :fbuid

  has_many :submissions
  has_many :votes

  belongs_to :current_topic, class_name: 'Topic'

  after_create :assign_topic!

  def self.initialize_from_facebook(fb_user)
    Player.create(
        name: fb_user.name,
        fbuid: fb_user.raw_attributes[:id],
        email: fb_user.raw_attributes[:email]
    )
  end


  BASE_POINTS_PER_SUBMISSION = 10
  POINTS_PER_VOTE_CAST = 1

  def score
    # This scoring algorithm is in flux. We calculate from scratch for everything for now.
    ret = {}
    ret[:submissions] = self.submissions.count * BASE_POINTS_PER_SUBMISSION
    ret[:votes_cast] = self.votes.count * POINTS_PER_VOTE_CAST
    ret[:votes_received] = self.submissions.collect(&:score).sum

    ret
  end


  def assign_topic!
    self.current_topic = Topic.unseen_by_player(self).order('RANDOM()').first ||
        Topic.order('RANDOM()').first
    self.current_topic_updated_at = Time.now
    self.save!
  end

  def update_current_topic_if_needed
    if self.current_topic.nil? || self.current_topic_updated_at.nil? ||
        self.current_topic_updated_at.day < Time.now.day
      self.assign_topic!
    end
  end


  def facebook_image
    "http://graph.facebook.com/#{self.fbuid}/picture"
  end

  def unseen_submissions
    already_voted_submission_ids = Vote.where(player: self).collect(&:submission_id) || []
    player_submission_ids = Submission.where(player: self)
    submissions = already_voted_submission_ids.concat(player_submission_ids)
    if submissions.any?
      Submission.where('id NOT IN (?)', submissions)
    else
      Submission.first
    end
  end

  def unseen_count
    unseen_submissions.count
  end
end

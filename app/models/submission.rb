class Submission < ActiveRecord::Base
  belongs_to :topic
  belongs_to :player
  has_many :votes
  has_attached_file :image,
      styles: { thumb: '100x100>', large: '500x500' }

  validates_presence_of :topic, :player, :image
  default_scope order('created_at DESC')
  after_create :update_player_topic

  def score
    self.votes.collect(&:score).sum
  end

  def upvotes
    self.votes.where(positive: true)
  end

  def downvotes
    self.votes.where(positive: false)
  end

  private

  def update_player_topic
    self.player.assign_topic!
  end

end

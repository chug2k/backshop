class Submission < ActiveRecord::Base
  belongs_to :topic
  belongs_to :player
  has_many :votes
  has_attached_file :image,
      styles: { thumb: '100x100>', large: '500x500' }

  validates_presence_of :topic, :player, :image
  default_scope order('created_at DESC')


  def upvotes
    self.votes.where(positive: true)
  end

  def downvotes
    self.votes.where(positive: false)
  end

end

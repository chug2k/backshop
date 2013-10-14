class Topic < ActiveRecord::Base
  has_many :submissions

  scope :unseen_by_player, (lambda do |player|
    Topic.where('id NOT IN (?)', player.submissions.collect(&:topic_id).uniq)
  end)
end

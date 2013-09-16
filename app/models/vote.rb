class Vote < ActiveRecord::Base
  belongs_to :submission
  belongs_to :player
  validates :positive, :inclusion => {:in => [true, false]}

  validates_presence_of :submission, :player

end

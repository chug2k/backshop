class Player < ActiveRecord::Base
  validates_presence_of :fbuid

  has_many :submissions
end

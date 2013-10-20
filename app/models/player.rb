class Player < ActiveRecord::Base
  validates_presence_of :fbuid

  has_many :submissions

  def self.initialize_from_facebook(fb_user)
    player = Player.new
    player.name = fb_user.name
    player.fbuid = fb_user.raw_attributes[:id]
  end

end

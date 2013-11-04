class LeaderboardsController < ApplicationController
  def index
    if params[:type] == 'photos'
      @submissions = Submission.all.sort_by {|x| -x.score}
    else
      @players = Player.all.sort_by { |x| -x.score.values.sum }
    end
  end
end

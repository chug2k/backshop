class SessionsController < ApplicationController
  def create
    if @current_player.blank?
      token = params[:token]
      fb_user = FbGraph::User.me(token).fetch
      fbuid = fb_user.raw_attributes[:id]
      player = Player.find_by_fbuid(fbuid) || Player.initialize_from_facebook(fb_user)
      if player.email.blank?
        player.email = fb_user.raw_attributes[:email]
        player.save!
      end
      Token.create(player: player, token: token)
      @current_player = player
    end

    # TODO(Charles): Maybe throw next_word in here.
    respond_to do |format|
      format.json {
          render json: {
              score: @current_player.score.values.sum,
              name: @current_player.name,
              unseen_count: @current_player.unseen_count
          }
      }
    end
  end
end

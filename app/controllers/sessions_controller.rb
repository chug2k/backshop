class SessionsController < ApplicationController
  def create
    return if @current_player.present?

    token = params[:fb_token]
    fb_user = FbGraph::User.me(token).fetch
    fbuid = fb_user.raw_attributes[:id]
    player = Player.find_by_fbuid(fbuid) || Player.initialize_from_facebook(fb_user)
    Token.create(player: player, token: token)

    # TODO(Charles): Maybe throw next_word in here.

    respond_to do |format|
      format.json {
          render json: {points: 25}
      }

    end
  end
end

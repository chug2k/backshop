class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_player, only: [:new, :create]
  before_action :set_submission, only: [:new]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
    if @submission.nil?
      return render 'done_voting'
    end
    if params[:prev_vote].present?
      @prev_vote = Vote.find(params[:prev_vote])
      @prev_submission = @prev_vote.submission
    end
    @votes_with_comments =
        @submission.votes.select{|v| v.comment.present?}
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)
    if vote_params['positive'] == 'true'
      @vote.positive = true
    elsif
      vote_params['positive'] == 'false'
      @vote.positive = false
    end

    @vote.player ||= @player

    respond_to do |format|
      if @vote.save
        format.html { redirect_to new_vote_path(fbuid: @vote.player.fbuid, prev_vote: @vote)}
        format.json { render action: 'show', status: :created, location: @vote }
      else
        format.html { render action: 'new' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_player
    @player = Player.find_by_fbuid(params[:fbuid])
  end

  def set_submission
    @submission = @player.unseen_submissions.first
  end

  def vote_params
    params.require(:fbuid)
    params.require(:vote).permit(:submission_id, :positive, :player_id, :comment)
  end
end

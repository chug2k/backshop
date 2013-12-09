class Notifier < ActionMailer::Base
  default from: 'founders@stinkystudios.com'
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def new_vote(vote)
    @player = vote.submission.player
    unless @player.email.blank?
      @vote = vote
      mail( :to => @player.email,
            :subject => "#{vote.player.name} thinks you're #{@vote.positive? ? 'sweet':'stinky'}" )
    end
  end
end
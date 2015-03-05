class ParticipantMailer < ApplicationMailer
  default from: "TheGridPool@gmail.com"

  def game_winner_email(game, participant)
    @game = game
    @participant = participant
    @results = Result.where(participant_id: participant.id, round: game.round, year: $year)
    @payouts = Payout.where(year: $year)
    mail(to: @participant.email, subject: "Sample Email", bcc: "TheGridPool@gmail.com")
  end
end

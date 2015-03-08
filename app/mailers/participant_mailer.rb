class ParticipantMailer < ApplicationMailer
  default from: "TheGridPool@gmail.com", bcc: "TheGridPool@gmail.com"
  # %("The Grid Pool" <"TheGridPool@gmail.com">)

  def game_winner_email(game)
    @game = game
    @participant = Participant.find_by(id: game.square_winner_id)
    @participant_squares = ParticipantSquare.where(participant_id: @participant.id, year: $year)
    @results = Result.where(participant_id: @participant.id, year: $year)
    @payout = Payout.find_by(round: game.round, year: $year)
    mail(to: @participant.email, subject: "Sample Email")
  end
end

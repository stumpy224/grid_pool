# Preview emails - http://localhost:3000/rails/mailers/participant_mailer
# Preview game winner email - http://localhost:3000/rails/mailers/participant_mailer/game_winner_email_preview
class ParticipantMailerPreview < ActionMailer::Preview
  def game_winner_email_preview
    $year = "2014"
    ParticipantMailer.game_winner_email(create_preview_game)
  end

  def create_preview_game
    g = Game.new
    g.round = 3
    g.square_winner_id = 18
    g.team_on_top_seed = 3
    g.team_on_top_name_short = "Purdue"
    g.team_on_top_score = 87
    g.team_on_top_is_winner = true
    g.team_on_bottom_seed = 14
    g.team_on_bottom_name_short = "Indiana"
    g.team_on_bottom_score = 78
    g.team_on_bottom_is_winner = false
    return g
  end
end

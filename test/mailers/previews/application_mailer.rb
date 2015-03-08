# Preview all emails at http://localhost:3000/rails/mailers/application_mailer
class ApplicationMailerPreview < ActionMailer::Preview
  def game_winner_email_preview
    $year = "2015"
    ApplicationMailer.game_winner_email(create_preview_game)
  end

  def create_preview_game
    g = Game.new
    g.round = 3
    g.square_winner_id = 1
    g.team_on_top_seed = 8
    g.team_on_top_name_short = "Purdue"
    g.team_on_top_score = 87
    g.team_on_top_is_winner = true
    g.team_on_bottom_seed = 9
    g.team_on_bottom_name_short = "Northwestern"
    g.team_on_bottom_score = 78
    g.team_on_bottom_is_winner = false
    return g
  end
end

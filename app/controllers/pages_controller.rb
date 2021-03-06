require 'net/http'

class PagesController < ApplicationController
  respond_to :html, :xml, :json, :js

  def bracket
    set_global_year
    get_tourney_games
    @games = Game.all
    @regions = Region.where(year: $year)
    @years = Year.all

    respond_with(@games, @regions, @years)
  end

  def results
    set_global_year

    @sql =  "SELECT DISTINCT pa.id, "\
              "CASE "\
                "WHEN pa.display_name IS NULL OR pa.display_name = '' "\
                  "THEN pa.name "\
                "ELSE pa.display_name "\
              "END AS preferred_name "\
            "FROM participants pa "\
              "INNER JOIN participant_squares ps "\
                "ON pa.id = ps.participant_id "\
                "AND ps.year = '" + $year + "' "\
            "GROUP BY pa.id "\
            "ORDER BY preferred_name"

    @participants_with_squares = Participant.find_by_sql(@sql)
    @participant_squares = ParticipantSquare.where(year: $year)
    @participants = Participant.all
    @payouts = Payout.where(year: $year)
    @results = Result.where(year: $year)
    @years = Year.all
    @year = Year.find_by(year: $year)

    respond_with(@participants_with_squares, @participant_squares, @results)
  end

  def refresh_bracket
    redirect_to action: 'bracket', year: $year
    get_tourney_games if !Game.exists?
  end

  def refresh_results
    redirect_to action: 'results', year: $year
    get_tourney_games
  end

  def grid
    set_global_year
    @participant_id = params[:participant_id]

    @squares = Square.order(winner_digit: :asc, loser_digit: :asc)
    @participant_squares = ParticipantSquare.select(:participant_id).where(year: $year)
    @participants = Participant.all
    @years = Year.all
    @winner_digits = @years.where(year: $year).first.winner_digits
    @loser_digits = @years.where(year: $year).first.loser_digits
  end

  def faq
    set_global_year
  end

  private

    def set_global_year
      if params[:year].present?
        $year = params[:year]
      else
        $year = get_latest_year
      end
    end

    def get_tourney_games
      tourney_games = get_tourney_info
      
      if tourney_games.include?('Oh, snap!')
        flash.now[:error] = tourney_games
      else
        tourney_games.each do |g|
          game = translate_game_info(g)
          create_new_result_if_necessary(game) if game.game_over?
        end
      end
    end

    def person_params
      params.permit(:year, :refresh)
    end
end

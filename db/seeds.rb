(0..9).each do |w|
  (0..9).each do |l|
    Square.create( winner_digit: w, loser_digit: l)
  end
end

Year.create(year: "2015", 
  source_url: "http://data.ncaa.com/jsonp/gametool/brackets/championships/basketball-men/d1/2014/data.json", 
  winner_digits: "8,7,2,0,6,5,4,1,9,3", loser_digits: "8,4,2,7,9,1,0,5,3,6", square_cost: 10)
Year.create(year: "2014", 
  source_url: "http://data.ncaa.com/jsonp/gametool/brackets/championships/basketball-men/d1/2013/data.json", 
  winner_digits: "8,7,2,0,6,5,4,1,9,3", loser_digits: "8,4,2,7,9,1,0,5,3,6", square_cost: 5)
Year.create(year: "2013", 
  source_url: "http://data.ncaa.com/jsonp/gametool/brackets/championships/basketball-men/d1/2012/data.json", 
  winner_digits: "2,8,4,6,7,0,5,9,3,1", loser_digits: "4,0,2,5,9,8,1,7,3,6", square_cost: 5)

Participant.create(name: "Winnie the Pooh")
Participant.create(name: "Piglet")
Participant.create(name: "Christopher Robin")
Participant.create(name: "Conan O'Brien")
Participant.create(name: "Jay Leno")
Participant.create(name: "David Letterman")
Participant.create(name: "Peter Griffin")
Participant.create(name: "Stewey Griffin")
Participant.create(name: "Lois Griffin")
Participant.create(name: "Brian Griffin")
Participant.create(name: "Meg Griffin")
Participant.create(name: "Chris Griffin")
Participant.create(name: "Homer Simpson")
Participant.create(name: "Marge Simpson")
Participant.create(name: "Bart Simpson")
Participant.create(name: "Lisa Simpson")
Participant.create(name: "Tim Taylor")
Participant.create(name: "Al Borland")
Participant.create(name: "Donald Trump")
Participant.create(name: "Walter White")
Participant.create(name: "Skyler White")
Participant.create(name: "Mickey Mouse")
Participant.create(name: "Minnie Mouse")
Participant.create(name: "Tom Crean")
Participant.create(name: "Matt Painter")

counter = 0
(1..25).each do |p|
  (1..4).each do |s|
    square_id = counter + 1
    ParticipantSquare.create(participant_id: p, square_id: square_id, year: "2014")
    counter += 1
  end
end

counter = 0
(1..25).each do |p|
  (1..4).each do |s|
    square_id = counter + 1
    ParticipantSquare.create(participant_id: p, square_id: square_id, year: "2015")
    counter += 1
  end
end

Payout.create(year: "2015", round: "1", game_payout: "5")
Payout.create(year: "2015", round: "2", game_payout: "5")
Payout.create(year: "2015", round: "3", game_payout: "10")
Payout.create(year: "2015", round: "4", game_payout: "20")
Payout.create(year: "2015", round: "5", game_payout: "40")
Payout.create(year: "2015", round: "6", game_payout: "80")
Payout.create(year: "2015", round: "7", game_payout: "180")

Region.create(year: "2015", name: "West", quadrant_id: "1", style: "top:246px;right:213px;")
Region.create(year: "2015", name: "South", quadrant_id: "2", style: "top:246px;right:218px;")
Region.create(year: "2015", name: "East", quadrant_id: "3", style: "top:230px;right:225px;")
Region.create(year: "2015", name: "Midwest", quadrant_id: "4", style: "top:230px;right:197px;")

Payout.create(year: "2014", round: "2", game_payout: "5")
Payout.create(year: "2014", round: "3", game_payout: "8")
Payout.create(year: "2014", round: "4", game_payout: "10")
Payout.create(year: "2014", round: "5", game_payout: "15")
Payout.create(year: "2014", round: "6", game_payout: "20")
Payout.create(year: "2014", round: "7", game_payout: "32")

Region.create(year: "2014", name: "West", quadrant_id: "1", style: "top:246px;right:213px;")
Region.create(year: "2014", name: "South", quadrant_id: "2", style: "top:246px;right:218px;")
Region.create(year: "2014", name: "East", quadrant_id: "3", style: "top:230px;right:225px;")
Region.create(year: "2014", name: "Midwest", quadrant_id: "4", style: "top:230px;right:197px;")

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

def create_players
  #create the first player
  user = Player.create(name: user_name, points: 0)

  #create the virtual players
  3.times do
    Player.create(name: Faker::Name.name, points: 0)
  end

end

#   def reset
#     BlackCard.all.each{|card| card.update_attributes(played: false, player_id: nil)}
#     WhiteCard.all.each{|card| card.update_attributes(played: false, player_id: nil)}
#     Player.all.each{|player| player.destroy}
#   end

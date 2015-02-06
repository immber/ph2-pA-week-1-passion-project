require 'Faker'

def create_player
  Player.create(name: Faker::Name.name, points: 0)
end

def start_game
  #make the user player 1
  player1 = Player.create(name: current_user.username, points: 0)
  #make a game to hold the players
  Game.create(user_id: current_user.id, users_current_player: player1.id, player_2: create_player.id, player_3: create_player.id, player_4: create_player.id)
end


def draw_start_hands
  current_players.each do |player|
    7.times do
      player.draw_white_card
    end
  end
end

def current_game
  Game.find_by(user_id: current_user.id)
end


def current_players
  players = []
  players << Player.find(current_game.users_current_player)
  players << Player.find(current_game.player_2)
  players << Player.find(current_game.player_3)
  players << Player.find(current_game.player_4)
  return players
end


def reset
  #nukes game, players and played cards with this player's id
  # @Players.all.each{|player| player.destroy}
end



# def turn
#   read_black_card
#   cards_played = played_cards
# #     winning_card = pick_winning_card(cards_played)
# #     show_winner(winning_card)
# #     check_points
# #     players_draw if !@game_over
# end

# def read_black_card
# #     @black_card = BlackCard.where(played: false, player_id: nil).sample
# #     @view.read_card(@black_card)
#  end

#  #   def played_cards
# #     played_cards = []
# #     choosen_card_id = @view.choose_card
# #     if @players[0].hand.any? {|card| card.id == choosen_card_id }
# #       played_cards << (WhiteCard.find(choosen_card_id))
# #     else
# #       @view.wrong_card
# #       played_cards()
# #     end
# #      @players.each_with_index do |player, index|
# #       if index != 0
# #         played_cards << player.hand.sample
# #       end
# #     end
# #     played_cards.each {|card| card.update_attributes( played: true )}
# #     @view.read_played(played_cards, @black_card)
# #     return played_cards
# #   end

# #   def pick_winning_card(played_cards)
# #     played_cards.sample
# #   end

# #   def show_winner(winning_card)
# #     @view.read_winner(winning_card, @black_card)
# #     @black_card.update_attributes(player_id: winning_card.player_id)
# #     winning_player = @players.find{ |player| player.id == winning_card.player_id}
# #     winning_player.update_attributes(points: (winning_player.points + 1))
# #   end

# #   def check_points
# #     @view.show_score(@players)
# #     @players.each do |player|
# #       if player.winner?
# #         @game_over = true
# #         @view.winning_player(player)
# #         break
# #       end
# #     end
# #   end


# #   def players_draw
# #     Player.all.each do |player|
# #       player.draw_card
# #     end
# #   end

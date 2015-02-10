require 'faker'

def create_player
  Player.create(name: Faker::Name.name, points: 0)
end

def start_game
  #make the user player 1
  player1 = Player.create(name: current_user.username, points: 0)

  if current_game
    destroy_game(current_game.id)
  end

  Game.create(user_id: current_user.id, users_current_player: player1.id, player_2: create_player.id, player_3: create_player.id, player_4: create_player.id)
end

def current_game
  Game.find_by(user_id: current_user.id)
end

def destroy_game(id)
  Game.find(id).played_cards.each do |played_card|
    played_card.destroy
  end
  Game.destroy(id)
end

def add_card_to_player(player,card)
  PlayedCard.create(player_id: player.id, card_id: card.id, game_id: current_game.id)
end


def draw_start_hands
  current_players.each do |player|
    7.times do
      card = player.draw_white_card
      add_card_to_player(player,card)
    end
  end
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

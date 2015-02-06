def draw_black_card
  available_cards = Card.joins("LEFT JOIN played_cards ON played_cards.card_id = cards.id where played_cards.card_id is null and cards.color = 'black'")

  available_cards.sample
end

def save_black_card(black_card)
  PlayedCard.create(card_id: black_card.id, player_id: current_players[0].id, played: "black")
end

def black_card_in_play
  PlayedCard.find_by(played: "black", player_id: current_players[0].id).card
end

def virtual_players_go(users_card)
  played_cards = []
  played_cards << users_card
  current_players.each_with_index do |virtual_player, index|
    played_cards << virtual_player.cards_in_hand.sample if index != 0
  end
  return played_cards
end

def save_cards_played(cards_played)
  cards_played.each do |card|
    PlayedCard.find_by(card_id: card.id, game_id: current_game.id).update_attributes(played: "current")
  end
end

def white_cards_in_play
  white_cards = PlayedCard.where(played: "current", game_id: current_game.id).map do |played_card|
    Card.find(played_card.card_id)
  end
end


def pick_winning_card
  white_cards_in_play.sample
end

def update_points(winner)
  winner.points += 1
  winner.save
end


def game_over?
  current_players.each do |player|
    return true if player.points == 5
  end
  return false
end

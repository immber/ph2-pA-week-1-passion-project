def draw_black_card
  available_cards = Card.joins("LEFT JOIN played_cards ON played_cards.card_id = cards.id where played_cards.card_id is null and cards.color = 'black'")

  available_cards.sample
end
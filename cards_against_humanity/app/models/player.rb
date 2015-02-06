class Player < ActiveRecord::Base
  # has_many :hands
  has_many :played_cards
  has_many  :cards, :through => :played_cards

  def draw_white_card
    available_cards = Card.joins("LEFT JOIN played_cards ON played_cards.card_id = cards.id where played_cards.card_id is null and cards.color = 'white'")

    card = available_cards.sample

    self.played_cards.create(card_id: card.id)

  end

  def cards_in_hand
    all_cards = self.played_cards.where(played: nil)
  end

end

  #me.played_cards.all
  #me.cards.all

  #card.players.all
  #card.played_cards

  # avail = PlayedCard.includes(:card)

  #points.increment??

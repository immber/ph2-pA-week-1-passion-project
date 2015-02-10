class Player < ActiveRecord::Base
  # has_many :hands
  has_many :played_cards
  has_many  :cards, :through => :played_cards


  def draw_white_card
    available_cards = Card.joins("LEFT JOIN played_cards ON played_cards.card_id = cards.id where played_cards.card_id is null and cards.color = 'white'")

    card = available_cards.sample


  end

  def cards_in_hand
    all_cards = self.played_cards.where(played: nil, ).map do |played_card|
      Card.find(played_card.card_id)
    end
  end

end

  #me.played_cards.all
  #me.cards.all

  #card.players.all
  #card.played_cards

  # avail = PlayedCard.includes(:card)

  #points.increment??

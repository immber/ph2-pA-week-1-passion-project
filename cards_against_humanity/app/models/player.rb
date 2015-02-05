class Player < ActiveRecord::Base
  # has_many :hands
  has_many :played_cards
  has_many  :cards, :through => :played_cards
end

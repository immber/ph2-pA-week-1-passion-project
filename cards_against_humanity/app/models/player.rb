class Player < ActiveRecord::Base
  has_many :hands
  has_many :won_cards
  has_many  :cards, :through => :won_cards
end

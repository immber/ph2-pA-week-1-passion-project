class Hand < ActiveRecord::Base
  belongs_to :player
  has_many :cards_in_hands
  has_many :cards, :through :cards_in_hands
end

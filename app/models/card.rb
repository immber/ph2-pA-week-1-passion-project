class Card < ActiveRecord::Base
  has_many :played_cards
  has_many :players, :through => :played_cards

end

class Card < ActiveRecord::Base
  belongs_to :card_in_hand
  belongs_to :won_card

end

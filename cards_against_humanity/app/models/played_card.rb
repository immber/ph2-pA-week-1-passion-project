class PlayedCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :player
end

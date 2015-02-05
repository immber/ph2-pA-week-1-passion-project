class CreateCardsInHands < ActiveRecord::Migration
  def change
    create_table :cards_in_hands do |t|
      t.belongs_to  :hand
      t.belongs_to  :player
      t.boolean     :played

      t.timestamps
    end
  end
end

class CreatePlayedCards < ActiveRecord::Migration
  def change
    create_table :played_cards do |t|
      t.integer :card_id
      t.integer :player_id
      t.string :played
      t.integer :game_id

      t.timestamps
    end
  end
end

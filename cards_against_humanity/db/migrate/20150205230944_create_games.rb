class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :users_current_player
      t.integer :player_2
      t.integer :player_3
      t.integer :player_4

      t.timestamps
    end
  end
end

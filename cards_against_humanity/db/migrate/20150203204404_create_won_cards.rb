class CreateWonCards < ActiveRecord::Migration
  def change
    create_table :won_cards do |t|
      t.belongs_to :player
      t.belongs_to :card

      t.timestamps
    end
  end
end

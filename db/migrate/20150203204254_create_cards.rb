class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :color
      t.string :text
      t.integer :created_by

      t.timestamps
    end
  end
end

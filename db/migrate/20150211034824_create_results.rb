class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :participant_id
      t.integer :round
      t.integer :game_id
      t.string :year

      t.timestamps null: false
    end
  end
end

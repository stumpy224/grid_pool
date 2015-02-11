class CreateSquares < ActiveRecord::Migration
  def change
    create_table :squares do |t|
      t.integer :winner_digit
      t.integer :loser_digit

      t.timestamps null: false
    end
  end
end

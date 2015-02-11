class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :year
      t.string :source_url
      t.datetime :results_last_updated_at
      t.datetime :bracket_last_updated_at
      t.string :winner_digits
      t.string :loser_digits

      t.timestamps null: false
    end
  end
end

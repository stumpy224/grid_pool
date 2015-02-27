class AddSquareCostToYear < ActiveRecord::Migration
  def change
    add_column :years, :square_cost, :integer
  end
end

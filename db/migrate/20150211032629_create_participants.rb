class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :display_name
      t.string :email
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end

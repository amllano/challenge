class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.text :status
      t.boolean :turn
      t.string :player
      t.references :opponent, references: :games

      t.timestamps
    end
  end
end

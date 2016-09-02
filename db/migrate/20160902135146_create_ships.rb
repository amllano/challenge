class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.text :status
      t.integer :size
      t.integer :origin_x
      t.integer :origin_y
      t.string :orientation
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end

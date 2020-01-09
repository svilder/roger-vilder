class CreateExpositions < ActiveRecord::Migration[5.2]
  def change
    create_table :expositions do |t|
      t.string :title
      t.string :exhibition
      t.string :city
      t.string :category
      t.integer :year

      t.timestamps
    end
  end
end

class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.string :place
      t.string :city
      t.string :category
      t.integer :year

      t.timestamps
    end
  end
end

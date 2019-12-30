class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :name
      t.string :description
      t.string :dimensions
      t.integer :year
      t.string :image
      t.string :youtube_link
      t.string :category
      t.string :collection

      t.timestamps
    end
  end
end

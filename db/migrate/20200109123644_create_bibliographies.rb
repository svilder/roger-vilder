class CreateBibliographies < ActiveRecord::Migration[5.2]
  def change
    create_table :bibliographies do |t|
      t.string :author
      t.string :title
      t.integer :year
      t.string :month

      t.timestamps
    end
  end
end

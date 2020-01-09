class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string :title_fr
      t.string :title_en
      t.string :author
      t.text :content_fr
      t.text :content_en
      t.integer :year

      t.timestamps
    end
  end
end

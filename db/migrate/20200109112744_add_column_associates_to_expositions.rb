class AddColumnAssociatesToExpositions < ActiveRecord::Migration[5.2]
  def change
    add_column :expositions , :associates, :string
  end
end

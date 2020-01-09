class AddColumnAssociatesToExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions , :associates, :string
  end
end

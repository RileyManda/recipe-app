class AddAttributesToFood < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :name, :string
    add_column :foods, :measurement_unit, :string
    add_column :foods, :price, :decimal
    add_column :foods, :quantity, :integer
    add_reference :foods, :user, null: false, foreign_key: true
  end
end

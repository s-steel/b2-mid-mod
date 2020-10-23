class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :rating
      t.references :park, foreign_key: true
    end
  end
end

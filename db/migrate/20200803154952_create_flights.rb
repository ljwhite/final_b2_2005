class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :number
      t.string :date
      t.string :time
      t.string :departure
      t.string :arrival

      t.timestamps
    end
  end
end
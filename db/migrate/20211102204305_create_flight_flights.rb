class CreateFlightFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :dep_airport, null: false, index:true
      t.references :arr_airport, null: false, index:true
      t.datetime :start_datetime
      t.integer :duration

      t.timestamps
    end

    add_foreign_key :flights, :airports, column: dep_airport_id
    add_foreign_key :flights, :airports, column: arr_airport_id
  end
end

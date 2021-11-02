class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :dep_airport, null: false, index:true, foreign_key: {to_table: :airports}
      t.references :arr_airport, null: false, index:true,foreign_key: {to_table: :airports}
      t.datetime :start_datetime
      t.time :duration

      t.timestamps
    end
  end
end

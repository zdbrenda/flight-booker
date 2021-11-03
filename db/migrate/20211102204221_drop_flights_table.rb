class DropFlightsTable < ActiveRecord::Migration[6.1]
  def change
    drop :flights
  end
end

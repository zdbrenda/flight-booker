class AddNotNilToFlight < ActiveRecord::Migration[6.1]
  def change
    change_column :flights, :duration, :integer, null: false
  end
end

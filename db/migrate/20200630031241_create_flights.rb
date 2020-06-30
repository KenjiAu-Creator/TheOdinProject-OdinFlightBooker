class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :startId
      t.string :endId
      t.string :flightDuration

      t.timestamps
    end
  end
end

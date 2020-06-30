class ChangeFlightIdsToInts < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :startId
    remove_column :flights, :endId
    add_column :flights, :startId, :integer
    add_column :flights, :destinationId, :integer
  end
end

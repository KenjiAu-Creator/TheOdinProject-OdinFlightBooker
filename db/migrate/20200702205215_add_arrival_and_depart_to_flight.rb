class AddArrivalAndDepartToFlight < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :departTime, :string
    add_column :flights, :arrivalTime, :string
  end
end

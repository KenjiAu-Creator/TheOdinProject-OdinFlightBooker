class AddDateToFlight < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :date, :string
  end
end

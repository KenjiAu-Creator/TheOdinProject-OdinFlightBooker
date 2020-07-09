class AddFieldsToPassenger < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :name, :string
    add_column :passengers, :email, :string
  end
end

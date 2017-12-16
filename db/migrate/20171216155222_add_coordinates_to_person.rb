class AddCoordinatesToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :longitude, :float
    add_column :people, :latitude, :float
  end
end

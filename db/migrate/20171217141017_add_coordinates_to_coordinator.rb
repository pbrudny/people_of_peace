class AddCoordinatesToCoordinator < ActiveRecord::Migration[5.0]
  def change
    add_column :coordinators, :longitude, :float
    add_column :coordinators, :latitude, :float
  end
end

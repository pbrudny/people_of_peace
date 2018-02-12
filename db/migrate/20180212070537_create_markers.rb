class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.string :need
      t.string :color
      t.string :letter

      t.timestamps
    end
  end
end

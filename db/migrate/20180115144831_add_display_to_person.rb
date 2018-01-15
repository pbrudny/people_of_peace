class AddDisplayToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :display, :boolean
  end
end

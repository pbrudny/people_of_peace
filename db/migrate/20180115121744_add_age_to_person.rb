class AddAgeToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :age, :string
  end
end

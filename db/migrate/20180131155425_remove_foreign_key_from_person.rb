class RemoveForeignKeyFromPerson < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :people, column: :coordinator_id
  end
end

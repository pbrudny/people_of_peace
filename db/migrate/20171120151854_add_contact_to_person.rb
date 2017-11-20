class AddContactToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :contact, :string
  end
end

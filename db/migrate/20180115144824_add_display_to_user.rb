class AddDisplayToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :display, :boolean
  end
end

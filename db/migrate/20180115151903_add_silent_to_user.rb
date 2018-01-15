class AddSilentToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :silent, :boolean
  end
end

class AddFbToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fb, :string
  end
end

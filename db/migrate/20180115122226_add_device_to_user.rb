class AddDeviceToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :device, :string
  end
end

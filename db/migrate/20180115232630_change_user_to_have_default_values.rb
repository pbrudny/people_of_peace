class ChangeUserToHaveDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :display, :boolean, default: true
    change_column :users, :notify, :boolean, default: true
  end
end

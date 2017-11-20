class CreateCoordinators < ActiveRecord::Migration[5.0]
  def change
    create_table :coordinators do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :skype
      t.string :fb
      t.string :address
      t.text :note

      t.timestamps
    end
  end
end

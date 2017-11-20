class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :skype
      t.string :fb
      t.string :city
      t.string :source
      t.text :note
      t.integer :added_by
      t.string :fellowship
      t.boolean :need_gospel
      t.boolean :need_baptism
      t.boolean :need_healing
      t.boolean :need_deliverance
      t.boolean :need_holy_spirit
      t.boolean :need_bible_study
      t.boolean :remote_possible
      t.string :background
      t.string :status
      t.string :priority
      t.belongs_to :coordinator, foreign_key: true

      t.timestamps
    end
  end
end

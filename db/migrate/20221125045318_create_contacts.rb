class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :phone
      t.string :cellphone
      t.string :instagram
      t.references :ngo, null: false, foreign_key: true

      t.timestamps
    end
  end
end

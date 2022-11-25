class CreateNgos < ActiveRecord::Migration[7.0]
  def change
    create_table :ngos do |t|
      t.string :name, null: false
      t.text   :description
      t.string :cnpj, limit: 14
      t.string :website, null: false
      t.boolean :verified, default: false
      t.string :street, null: false
      t.string :number, default: '' 
      t.string :district, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, default: 'Brazil'
      t.string :email, null: false

      t.timestamps
    end
  end
end

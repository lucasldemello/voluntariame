class AddPhoneNumberToNgo < ActiveRecord::Migration[7.0]
  def change
    add_column :ngos, :phone_number, :string, null: false
  end
end

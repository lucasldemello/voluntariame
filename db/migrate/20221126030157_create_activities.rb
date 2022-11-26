class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.integer :used_count, default: 0 

      t.timestamps
    end
  end
end

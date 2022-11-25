class AddLatituteLongitudeForNgos < ActiveRecord::Migration[7.0]
  def change
      add_column :ngos, :latitude, :decimal, precision: 10, scale: 6
      add_column :ngos, :longitude, :decimal, precision: 10, scale: 6
  end
end

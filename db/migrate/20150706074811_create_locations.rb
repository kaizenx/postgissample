class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.st_point :lonlat, geographic: true

      t.timestamps null: false
    end
  end
end

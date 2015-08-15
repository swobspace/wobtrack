class CreateTrackpoints < ActiveRecord::Migration
  def change
    create_table :trackpoints do |t|
      t.decimal :longitude, precision: 10, scale: 8, null: false
      t.decimal :latitude, precision: 10, scale: 8, null: false
      t.string :elevation{8,2}, default: 0
      t.datetime :time, null: false
      t.references :track, index: true, foreign_key: true
      t.integer :heart_rate

      t.timestamps null: false
    end
  end
end

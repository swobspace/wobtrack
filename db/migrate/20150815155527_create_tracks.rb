class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, default: ""
      t.text :description, default: ""
      t.date :date
      t.references :wobauth_user, index: true, foreign_key: true
      t.string :creator, default: ""

      t.timestamps null: false
    end
    add_index :tracks, :date
  end
end

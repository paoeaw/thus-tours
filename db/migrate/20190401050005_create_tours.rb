class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :details
      t.integer :provider_id, index: true
      t.string :photo
      t.integer :cost
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

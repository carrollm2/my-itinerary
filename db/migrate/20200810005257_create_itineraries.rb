class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.integer :user_id
      t.integer :destination_id
      t.integer :event_id
      t.text :notes

      t.timestamps
    end
  end
end

class CreateItineraryEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :itinerary_events do |t|
      t.text :notes

      t.timestamps
    end
  end
end

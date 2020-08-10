class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :description
      t.string :ticket_site
      t.date :event_date
      t.time :event_time

      t.timestamps
    end
  end
end

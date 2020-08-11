class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :destination_id
      t.text :description
      t.string :ticket_site
      t.date :event_date

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :ref
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests
      t.references :room

      t.timestamps
    end
    add_index :bookings, :room_id
  end
end

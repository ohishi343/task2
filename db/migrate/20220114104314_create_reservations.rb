class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :num_of_people
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end

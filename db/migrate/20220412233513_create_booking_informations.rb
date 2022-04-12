class CreateBookingInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_informations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile_number
      t.integer :booking_for
      t.datetime :booking_for_date
      t.datetime :booked_on
      t.datetime :booking_id
      t.datetime :status_id

      t.timestamps
    end
  end
end

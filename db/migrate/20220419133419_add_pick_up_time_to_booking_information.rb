class AddPickUpTimeToBookingInformation < ActiveRecord::Migration[7.0]
  def change
    add_column :booking_informations, :pick_up_time, :datetime
  end
end

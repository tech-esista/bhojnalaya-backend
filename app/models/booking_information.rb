class BookingInformation < ApplicationRecord
  after_save :set_booking_id

  private

  def set_booking_id
    update(booking_id: "BJNLY#{id}")
  end
end

class BookingInformation < ApplicationRecord
  after_create :set_booking_id

  private

  def set_booking_id
    self.update(booking_id: "BJNLY#{self.id}")
  end
end

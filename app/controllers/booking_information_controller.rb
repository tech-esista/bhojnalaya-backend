class BookingInformationController < ApplicationController
  
  def retrieve_booking_information
    bookings = BookingInformation.all

    if params[:for_date].present?
      bookings = bookings.where("booking_for_date > ?", params[:for_date].to_datetime.localtime)
    end

    render_result_json bookings
  end
  
  def save_booking_information
    return unless has_sufficient_params(%w[first_name last_name mobile_no booking_for booking_for_date])

    new_booking_information = BookingInformation.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      mobile_no: params[:mobile_no],
      booking_for: params[:booking_for],
      booked_on: DateTime.now,
      booking_for_date: params[:booking_for_date],
      # TODO: set constant for status_id
      status_id: 1
    )

    if new_booking_information.save
      render_result_message 'Saved New information'
    else
      render_error_message new_booking_information.errors.full_messages
    end
  end

  def update_booking_information
    return unless has_sufficient_params(%w[id status_id])

    booking_information = BookingInformation.where(id: params[:id])

    booking_information.update(status_id: params['status_id'])

    render_result_json 'Updated status for this booking information'
  end
end

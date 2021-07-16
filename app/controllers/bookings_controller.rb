class BookingsController < ApplicationController
  before_action :find_apartment, only: :create
  def index
    @booking = Booking.all.where(user_id: current_user)
  end

  def new
  end

  def create
    @booking_date = BookingForm.new(calculate_params)
    if @booking_date.valid?
      @book = CalculateTotalPrice.call(calculate_params)
      redirect_to new_booking_payment_path(@book.id)
    else
      render "apartments/show"
    end
  end

  private

  def calculate_params
    params.permit(:checkin, :checkout, :adult, :children,
    :infans).merge(price: @apartment.price, apartment: @apartment,
    user: current_user)
  end

  def find_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

end

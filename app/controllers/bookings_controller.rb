class BookingsController < ApplicationController
  before_action :find_apartment, only: :create

  def create
    @total_result = CalculateTotalPrice.call(calculate_params)
    @book = @apartment.booking.build(permit_params)
    binding.pry
    @book.save
    redirect_to root_path
  end

  private

  def calculate_params
    params.permit(:checkin, :checkout, :adult, :children,
                  :infans).merge(price: @apartment.price)
  end

  def find_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  def permit_params
    binding.pry
    params.permit(:checkin, :checkout, :adult, :children, :apartment_id,
                  :infans).merge(user_id: current_user.id, status: "unpaid",
                  total: @total_result[:total_price],
                  cleaning_fee: @total_result[:cleaning_fee],
                  service_fee: @total_result[:service_fee],
                  occupancy_fee: @total_result[:occupancy_fee])
  end
end

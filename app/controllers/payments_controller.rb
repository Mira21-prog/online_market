class PaymentsController < ApplicationController
  before_action :find_booking, only: [:new, :create]
  def new
  end

  def create
    @payment = @book.payments.build(permit_params)
    if @payment.save
      @book.paid!
      redirect_to root_path
    else
      flash.now[:messages] = @payment.errors.full_messages
      render :new
    end
  end

  private

  def find_booking
    @book = Booking.find(params[:booking_id])
  end

  def permit_params
    params.permit(:card_holder, :card_number,
                  :expiration, :cvv)
  end


end

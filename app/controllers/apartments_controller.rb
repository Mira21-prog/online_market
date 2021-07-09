class ApartmentsController < ApplicationController
  def show
    @apartment = Apartment.find(params[:id])
    authorize @apartment
  end
end

class CalculateTotalPrice < ApplicationService
  def initialize(params = {})
    @checkin = params[:checkin]
    @checkout = params[:checkout]
    @price = params[:price].to_i
    @adult = params[:adult].to_i
    @children = params[:children].to_i
    @infans = params[:infans].to_i
  end

  def call
    { total_price: total_price_with_fee, cleaning_fee: cleaning_fee,
      service_fee: service_fee, occupancy_fee: occupancy_fee,
      total_night:  total_night }
  end

  private

  def total_night
    (convert_to_day(@checkout) - convert_to_day(@checkin)).to_i
  end

  def convert_to_day(element)
    Date.strptime(element, '%M/%d/%Y')
  end

  def total_price_with_fee
    total_price + cleaning_fee + service_fee + occupancy_fee
  end

  def total_price
    base_price = (total_night * @price * @adult).to_f
    base_price += infans_price.to_f unless @infans.zero?
    base_price += children_price.to_f unless @children.zero?
    base_price.to_f
  end

  def infans_price
    Settings.procent.infans.to_f * @infans.to_f
  end

  def children_price
    Settings.procent.children.to_f * @children.to_f
  end

  def cleaning_fee
    total_price.to_f * Settings.fee.cleaning.to_f
  end

  def service_fee
    total_price.to_f * Settings.fee.service.to_f
  end

  def occupancy_fee
    total_price.to_f * Settings.fee.occupancy.to_f
  end

end

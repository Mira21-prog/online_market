class CalculateTotalPrice < ApplicationService
  include ActiveAttr::TypecastedAttributes
  include ActiveAttr::MassAssignment
  include ActiveAttr::TypecastedAttributes

  attr_accessor :checkin, :checkout, :apartment, :user

  attribute :price, :type => Integer
  attribute :adult, :type => Integer
  attribute :children, :type => Integer
  attribute :infans, :type => Integer

  def call
    @book = apartment.booking.build(hash_params)
    @book.tap { |book| book.save }
  end

  private
  def total_night
    (convert_to_day(checkout) - convert_to_day(checkin)).to_i
  end

  def convert_to_day(element)
    element.to_date
  end

  def total_price_with_fee
    total_price + cleaning_fee + service_fee + occupancy_fee
  end

  def total_price
    base_price = (total_night * price * adult).to_f
    base_price += infans_price.to_f unless infans.zero?
    base_price += children_price.to_f unless children.zero?
    base_price.to_f
  end

  def infans_price
    Settings.procent.infans.to_f * infans.to_f
  end

  def children_price
    Settings.procent.children.to_f * children.to_f
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

  def hash_params
    { checkin: checkin, checkout: checkout, adult: adult,
      children: children, apartment_id: apartment.id,
      infans: infans, user_id: user.id, status: "unpaid",
      total: total_price, cleaning_fee: cleaning_fee,
      service_fee: service_fee, occupancy_fee: occupancy_fee,
      night: total_night }
  end
end

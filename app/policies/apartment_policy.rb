class ApartmentPolicy < ApplicationPolicy
  def show?
    user.buyer? && user.present?
  end
end

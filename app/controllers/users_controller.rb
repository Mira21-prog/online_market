class UsersController < ApplicationController
  def show
    @user = current_user.decorate
    authorize @user.object, policy_class: BuyerPolicy
  end
end

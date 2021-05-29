class UsersController < ApplicationController
  def show
    @user = current_user.decorate
    authorize @user, policy_class: BuyerPolicy
  end
end

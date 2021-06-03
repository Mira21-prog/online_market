class PagesController < ApplicationController
  def home
    @categories = Category.where(parent_id: nil)
    @apartments = Apartment.all
  end
end

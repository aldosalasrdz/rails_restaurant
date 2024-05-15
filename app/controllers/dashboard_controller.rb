class DashboardController < ApplicationController
  layout 'dashboard'

  def index
    @restaurants = Restaurant.all
  end
end

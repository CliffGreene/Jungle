class Admin::DashboardController < ApplicationController
  def show
  @categories = Category.count(:id)
  @products = Product.count(:id)

  end
end

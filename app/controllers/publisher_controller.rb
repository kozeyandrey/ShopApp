class PublisherController < ApplicationController
  before_action :categories_variable
  helper_method :sort_column, :sort_direction

  # Return products by publisher
  def view_publisher
    @publisher = Publisher.find_by_slug(params[:slug])
    if params[:count].present?
      @products = Publisher.count_products(params[:count], @publisher, params[:page], sort_column, sort_direction)
      flash.now[:notice] = "Вам будет показано #{params[:count]} товаров"
    else
      @products = Publisher.count_products(10, @publisher, params[:page], sort_column, sort_direction)
    end
  end
end
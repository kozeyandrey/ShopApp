class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Return object Product by sort_column
  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  # Return sort_direction
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  # Return error 404
  def not_found(object)
    if object.blank?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end

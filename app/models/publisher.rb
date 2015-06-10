class Publisher < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :products

  # Return products by publisher
  def self.count_products(count, publisher, page, sort_column, sort_direction)
    return Product.where(publisher: publisher).order(sort_column + " " + sort_direction).paginate(:per_page => count, :page => page)
  end
end

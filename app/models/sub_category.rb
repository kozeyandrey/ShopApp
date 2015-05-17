class SubCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :products, dependent: :destroy
  belongs_to :category
end
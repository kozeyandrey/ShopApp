class Customer < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders

  validates :name, field: true
  validates :surname, field: true
  validates :phone_number, field: true, phone_number: true
  validates :country, field: true
  validates :first_address, field: true
  validates :city, field: true
  validates :postcode, field: true
  validates :email, field: true, confirmation: { message: 'не соответствует полю "E-mail адрес"' }, email: true
  validates :email_confirmation, field: true, email: true
end
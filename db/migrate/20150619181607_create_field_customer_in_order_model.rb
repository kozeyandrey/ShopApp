class CreateFieldCustomerInOrderModel < ActiveRecord::Migration
  def change
    add_reference :orders, :customer, :index => true
  end
end

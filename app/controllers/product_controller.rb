class ProductController < ApplicationController
  def view_product
    @product = Product.find_by_slug(params[:slug])
    @title = @product.title
    if params[:count_of_products].present?
      customer_product = CustomerProduct.where(product: @product).take
      if customer_product.present?
          @quantity = params[:count_of_products].to_i + customer_product.quantity
          customer_product.update(quantity: @quantity)
      else
          CustomerProduct.create(user_session_id: session['session_id'], product: @product, quantity: params[:count_of_products])
      end
      @quantity_products = @product.quantity_products - params[:count_of_products].to_i
      @product.update(quantity_products: @quantity_products)
      respond_to do |format|
        format.html { redirect_to view_product_path, notice: "Товар #{@title} добавлен в корзину" }
      end
    end
  end
end
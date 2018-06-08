class ProductsController < ApplicationController
before_action :authenticate_user!

 def index
   @products = Product.all
 end

 def show
   @product = Product.find(params[:id])
 end


 private

 def product_params
  params.require(:product).permit(:title, :description, :price, :quantity)
 end

end
